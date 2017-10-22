//
//  CommentViewController.swift ★
//  Instagram
//
//  Created by 濱田 一 on 2017/10/20.
//  Copyright © 2017年 濱田 一. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBAction func commentButton(_ sender: Any) {
        print("DEBUG_PRINT: コメント投稿ボタンがタップされました。")
        print("DEBUG_PRINT: \(self.commentTextView.text)")
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
