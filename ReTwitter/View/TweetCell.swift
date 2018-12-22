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
            
            HomeService.shared.downloadImage(url: tweet.user.profileImageUrl) { (image, error) in
                if error != nil {
                    return
                }
                if let imageFetched = image {
                    self.profileImageView.image = imageFetched
                }
            }
            
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
    
    let tweetOptionsStackView = UIStackView(arrangedSubviews: [])
    
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
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(tweetTextView)
        addSubview(tweetOptionsStackView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        tweetTextView.anchor(self.topAnchor, left: profileImageView.rightAnchor, bottom: self.tweetOptionsStackView.topAnchor, right: self.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        setupBottomTweetOptions()
        
        tweetOptionsStackView.anchor(nil, left: profileImageView.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: 0, heightConstant: 16)
        
    }
    
    fileprivate func setupBottomTweetOptions() {
        let comment = createTweetOptionView(buttonImage: UIImage(named: "comment")!)
        let retweet = createTweetOptionView(buttonImage: UIImage(named: "retweet-off")!)
        let like = createTweetOptionView(buttonImage: UIImage(named: "like-off")!)
        let share = createTweetOptionView(buttonImage: UIImage(named: "share")!)
        
        tweetOptionsStackView.addArrangedSubview(comment)
        tweetOptionsStackView.addArrangedSubview(retweet)
        tweetOptionsStackView.addArrangedSubview(like)
        tweetOptionsStackView.addArrangedSubview(share)
        
        tweetOptionsStackView.distribution = .fillEqually
        tweetOptionsStackView.spacing = 10
    }
    
    fileprivate func createTweetOptionView(buttonImage: UIImage) -> UIView {
        let view = UIView()
        
        let tweetImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = buttonImage
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        let tweetTextCount: UILabel = {
            let label = UILabel()
            let attributedText = NSMutableAttributedString(string: "123", attributes:  [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
            label.attributedText = attributedText
            return label
        }()
        
        view.addSubview(tweetImage)
        view.addSubview(tweetTextCount)
        
        tweetImage.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 28, heightConstant: 16)
        
        tweetTextCount.anchor(nil, left: tweetImage.rightAnchor, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 28, heightConstant: 16)
        
        return view
    }
    
}
