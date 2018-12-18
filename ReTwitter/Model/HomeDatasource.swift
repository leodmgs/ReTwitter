//
//  Datasource.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/12/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let steve = User(profileImage: UIImage(named: "steve-jobs")!, name: "Steve Jobs", username: "@stevejobs", bio: "Design is not just what it looks like and feels like. Design is how it works.\nInnovation distinguishes between a leader and a follower.")
        
        let stephen = User(profileImage: UIImage(named: "stephen-hawking")!, name: "Stephen Hawking", username: "@stephenhawking", bio: "Life would be tragic if it weren't funny.I have noticed even people who claim everything is predestined, and that we can do nothing to change it, look before they cross the road.")
        
        let elon = User(profileImage: UIImage(named: "elon-musk")!, name: "Elon Musk", username: "@elonmusk", bio: "When something is important enough, you do it even if the odds are not in your favor.")
        
        return [steve, stephen, elon]
    }()
    
    let tweets: [Tweet] = {
        let leonardo = User(profileImage: UIImage(named: "leonardo-domingues")!, name: "Leonardo Domingues", username: "@leodmgs", bio: "")
        let message1 = "The report adds new details to the portrait that has emerged over the last two years of the energy and imagination of the Russian effort to sway American opinion and divide the country, which the authors said continues to this day."
        let tweet1 = Tweet(user: leonardo, message: message1)
        
        let neil = User(profileImage: UIImage(named: "neil-degrasse")!, name: "Neil deGrasse", username: "@neildegrasse", bio: "")
        let message2 = "The second report was written by the Computational Propaganda Project at Oxford University along with Graphika, a company that specializes in analyzing social media. The Washington Post first reported on the Oxford report on Sunday."
        let tweet2 = Tweet(user: neil, message: message2)
        
        return [tweet1, tweet2]
    }()
    
    override func numberOfItems(_ section: Int) -> Int {
        return section == 0 ? users.count : tweets.count
    }
    
    override func numberOfSections() -> Int {
        return 2 // users and tweets collections
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        switch indexPath.section {
        case 0:
            return users[indexPath.item]
        case 1:
            return tweets[indexPath.item]
        default:
            return []
        }
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [HeaderCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterCell.self]
    }
    
}
