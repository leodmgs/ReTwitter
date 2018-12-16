//
//  HomeDatasourceController+navbar.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/16/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import UIKit

extension HomeDatasourceController {
    
    func setBarTitleView() {
        let titleImageView = UIImageView(image: UIImage(named: "twitter"))
        titleImageView.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        titleImageView.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
    
    func setLeftBarButtonItem() {
        let followButton = UIButton()
        followButton.setImage(UIImage(named: "follow"), for: .normal)
        followButton.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        followButton.contentMode = .scaleAspectFit
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    func setRightBarButtonItems() {
        let searchButton = UIButton()
        searchButton.setImage(UIImage(named: "search"), for: .normal)
        searchButton.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        searchButton.contentMode = .scaleAspectFit
        
        let composeButton = UIButton()
        composeButton.setImage(UIImage(named: "compose"), for: .normal)
        composeButton.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        composeButton.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        composeButton.contentMode = .scaleAspectFit
        
        let composeButtonItem = UIBarButtonItem(customView: composeButton)
        let searchButtonItem = UIBarButtonItem(customView: searchButton)
        
        navigationItem.rightBarButtonItems = [composeButtonItem, searchButtonItem]
    }
    
}
