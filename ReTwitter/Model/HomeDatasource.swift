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
        let leonardo = User(profileImage: UIImage(named: "leonardo-domingues")!, name: "Leonardo Domingues", username: "@leodmgs", bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.")
        let neil = User(profileImage: UIImage(named: "neil-degrasse")!, name: "Neil deGrasse", username: "@neildegrasse", bio: "The good thing about science is that it's true whether or not you believe in it. We are part of this universe; we are in this universe, but perhaps more important than both of those facts, is that the universe is in us.")
        let stephen = User(profileImage: UIImage(named: "stephen-hawking")!, name: "Stephen Hawking", username: "@stephenhawking", bio: "Life would be tragic if it weren't funny.I have noticed even people who claim everything is predestined, and that we can do nothing to change it, look before they cross the road.")
        let elon = User(profileImage: UIImage(named: "elon-musk")!, name: "Elon Musk", username: "@elonmusk", bio: "Important note for US Tesla buyers: Federal tax credit drops by $3750 in 3 weeks. To be on the cancellation waitlist for delivery this year or if you want a display car, order at Tesla.com or visit our stores. Full refund if Tesla can’t deliver your car this year.")
        return [steve, leonardo, neil, stephen, elon]
    }()
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [HeaderCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterCell.self]
    }
    
}
