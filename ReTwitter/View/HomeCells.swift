//
//  Cell.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/12/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import LBTAComponents

class HomeHeaderCell: DatasourceCell {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        addSubview(separatorLineView)
        addSubview(headerLabel)
        headerLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
    }
    
}

class HomeDataCell: DatasourceCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "steve-jobs")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@stevejobs"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Design is not just what it looks like and feels like. Design is how it works.\nInnovation distinguishes between a leader and a follower."
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
        button.setImage(UIImage(named: "follow-icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        return button
    }()
    
    override var datasourceItem: Any? {
        didSet {
            nameLabel.text = "Steve Jobs" //datasourceItem as? String
            nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        addSubview(separatorLineView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(self.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 12, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: -4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(usernameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 4, leftConstant: -4, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 100)
        
        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 40)
        
    }
    
}

class HomeFooterCell: DatasourceCell {
    
    let showMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show me more", for: .normal)
        button.setTitleColor(UIColor(r: 0, g: 122, b: 255), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(showMoreButton)
        showMoreButton.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 20)
    }
    
}
