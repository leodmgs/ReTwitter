//
//  TweetCell.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/17/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.orange
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
    }
    
}
