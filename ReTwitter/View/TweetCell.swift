//
//  TweetCell.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/17/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any?  {
        didSet {
            guard let tweet = datasourceItem as? Tweet else { return }
            profileImageView.image = tweet.user.profileImage
            
            let attributedString = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
            let username = "  \(tweet.user.username)\n"
            attributedString.append(NSAttributedString(string: username, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            let paragraphLineSpaceStyle = NSMutableParagraphStyle()
            paragraphLineSpaceStyle.lineSpacing = 5
            
            let range = NSMakeRange(0, attributedString.string.count)
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphLineSpaceStyle, range: range)
            
            attributedString.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]))
            
            tweetTextView.attributedText = attributedString
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let tweetTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15)
        return textView
    }()
    
//    let postImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(named: "apple-store")
//        return imageView
//    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(tweetTextView)
//        addSubview(postImageView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        tweetTextView.anchor(self.topAnchor, left: profileImageView.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 50, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
    }
    
}
