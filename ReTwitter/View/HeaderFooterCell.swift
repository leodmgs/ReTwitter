//
//  Cell.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/12/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import LBTAComponents

class HeaderCell: DatasourceCell {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        addSubview(headerLabel)
        headerLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
    }
    
}

class FooterCell: DatasourceCell {
    
    let showMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show me more", for: .normal)
        button.setTitleColor(UIColor(r: 0, g: 122, b: 255), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        let subview = UIView()
        subview.backgroundColor = .white
        subview.addSubview(showMoreButton)
        
        addSubview(subview)
        subview.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        // it must to be set at this place once that the subview needs to be anchored to a view.
        showMoreButton.anchor(subview.topAnchor, left: subview.leftAnchor, bottom: subview.bottomAnchor, right: subview.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
    }
    
}
