//
//  UserCell.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/13/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15)
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        let twitterColorBlue = UIColor(r: 61, g: 167, b: 244)
        button.layer.cornerRadius = 20
        button.layer.borderColor = twitterColorBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(twitterColorBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        let imageView = UIImageView(frame: CGRect(x: 15, y: 4, width: 32, height: 32))
        imageView.image = UIImage(named: "follow")
        button.addSubview(imageView)
        
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -30)
        return button
    }()
    
    override var datasourceItem: Any? {
        didSet {
            guard let user = datasourceItem as? User else { return }
            profileImageView.image = user.profileImage
            nameLabel.text = user.name
            usernameLabel.text = user.username
            bioTextView.text = user.bio
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        addSubview(separatorLineView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(self.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 12, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: -4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 4, leftConstant: -4, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 40)
        
    }
    
}
