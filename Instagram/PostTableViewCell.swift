//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 濱田 一 on 2017/10/20.
//  Copyright © 2017年 濱田 一. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel! // ★
    @IBOutlet weak var commentButton: UIButton! // ★
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostData(postData: PostData){
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name ?? "") : \(postData.caption ?? "")"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString: String = formatter.string(from: postData.date! as Date)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        }
        
        // 全コメントをラベルに設定 ★
        var all_comments = ""
        for (name, comment) in zip(postData.commentsName, postData.comments) {
            all_comments += "\(name) : \(comment)\n"
        }
        self.commentLabel.text = all_comments
    }
}
