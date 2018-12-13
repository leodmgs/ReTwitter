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
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
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
        addSubview(showMoreButton)
        showMoreButton.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 20)
    }
    
}
