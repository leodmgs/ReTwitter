//
//  HomeDatasourceController.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/12/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import LBTAComponents
import TRON

class HomeDatasourceController: DatasourceController {
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Oops! Something was wrong while loading the data. Please try again later..."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.addSubview(errorLabel)
        
        errorLabel.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        collectionView.backgroundColor = UIColor.init(r: 230, g: 230, b: 230)
        setNavigationBarItems()
        HomeService.shared.fetchDatasource(path: "twitter/home", completion: { (homeDatasource, error) in
            if let error = error {
                if let apiError = error as? APIError<HomeService.JSONError> {
                    print("\(String(describing: apiError.response?.statusCode))")
                }
                self.errorLabel.isHidden = false
                return
            }
            self.datasource = homeDatasource
        })
    }
    
    fileprivate func setNavigationBarItems() {
        if let navBar = navigationController?.navigationBar {
            navBar.barTintColor = UIColor.white
            navBar.isTranslucent = false
        }
        setBarTitleView()
        setLeftBarButtonItem()
        setRightBarButtonItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 60)
        }
        return CGSize(width: view.frame.width, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: view.frame.width, height: 0)
        }
        return CGSize(width: view.frame.width, height: 75)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        // to avoid that a uiview to replace the scroll bar
        if elementKind == UICollectionView.elementKindSectionHeader {
            view.layer.zPosition = 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            guard let userCell = datasource?.item(indexPath) as? User else { return .zero }
            let estimatedProfileSize = estimatedBoundingTextViewSize(text: userCell.bio, offset: 66)
            return estimatedProfileSize
        case 1:
            guard let tweetCell = datasource?.item(indexPath) as? Tweet else { return .zero }
            let estimatedTweetSize = estimatedBoundingTextViewSize(text: tweetCell.message, offset: 78)
            return estimatedTweetSize
        default:
            return CGSize(width: view.frame.width, height: 200)
        }
    }
    
    fileprivate func estimatedBoundingTextViewSize(text: String, offset: CGFloat = 0) -> CGSize {
        let textViewFrameWidth = view.frame.width - 82
        let textViewFrameSize = CGSize(width: textViewFrameWidth, height: 1000)
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        let boundingSize = NSString(string: text).boundingRect(with: textViewFrameSize, options: .usesLineFragmentOrigin, attributes: fontAttributes, context: nil)
        return CGSize(width: view.frame.width, height: boundingSize.height + offset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
