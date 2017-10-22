//
//  CommentViewController.swift ★
//  Instagram
//
//  Created by 濱田 一 on 2017/10/20.
//  Copyright © 2017年 濱田 一. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CommentViewController: UIViewController {
    
    var postData: PostData?
    
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBAction func commentButton(_ sender: Any) {
        print("DEBUG_PRINT: コメント投稿ボタンがタップされました。")

        // コメントとコメントした人の名前をFirebaseに保存する
        if let comment = commentTextView.text {
            postData?.comments.append(comment)
            let name = Auth.auth().currentUser?.displayName
            postData?.commentsName.append(name!)
        
            let postRef = Database.database().reference().child(Const.PostPath).child((postData?.id!)!)

            let comments = ["comments": postData?.comments]
            postRef.updateChildValues(comments)

            let commentsName = ["commentsName": postData?.commentsName]
            postRef.updateChildValues(commentsName)
        }

        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelCommentButton(_ sender: Any) {
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let color = UIColor(red: 186/255, green: 186/255, blue: 186/255, alpha: 1.0).cgColor
        commentTextView.layer.borderColor = color
        commentTextView.layer.borderWidth = 0.5
        commentTextView.layer.cornerRadius = 5
        
        // print("DEBUG_PRINT: \(String(describing: postData?.caption))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
