//
//  Cell.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/12/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import LBTAComponents

class HomeHeaderCell: DatasourceCell {
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.blue
    }
    
}

class HomeFooterCell: DatasourceCell {
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.green
    }
    
}

class HomeDataCell: DatasourceCell {
    
    let dataLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override var datasourceItem: Any? {
        didSet {
            dataLabel.text = datasourceItem as? String
        }
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.yellow
        addSubview(dataLabel)
        dataLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}
