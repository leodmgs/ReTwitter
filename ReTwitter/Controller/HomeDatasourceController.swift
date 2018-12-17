//
//  HomeDatasourceController.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/12/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import LBTAComponents

class HomeDatasourceController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.init(r: 230, g: 230, b: 230)
        setNavigationBarItems()
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
    }
    
    private func setNavigationBarItems() {
        if let navBar = navigationController?.navigationBar {
            navBar.barTintColor = UIColor.white
        }
        setBarTitleView()
        setLeftBarButtonItem()
        setRightBarButtonItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        // to avoid that a uiview to replace the scroll bar
        if elementKind == UICollectionView.elementKindSectionHeader {
            view.layer.zPosition = 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let userCell = datasource?.item(indexPath) as? User {
            let userTextBioWidth = view.frame.width - 82
            let size = CGSize(width: userTextBioWidth, height: 500)
            let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
            let boundingBoxSize = NSString(string: userCell.bio).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: fontAttributes, context: nil)
            return CGSize(width: view.frame.width, height: boundingBoxSize.height + 66)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
