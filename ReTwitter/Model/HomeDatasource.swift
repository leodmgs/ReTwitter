//
//  Datasource.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/12/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    var users: [User] = []
    var tweets: [Tweet] = []
    
    required init(json: JSON) throws {
        super.init()
        if let usersResponse = json["users"].array {
            self.users = usersResponse.map{User(json: $0)}
        }
        if let tweetsResponse = json["tweets"].array {
            self.tweets = tweetsResponse.map{Tweet(json: $0)}
        }
    }
    
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
    
    class HomeDatasourceJSONError: JSONDecodable {
        required init(json: JSON) throws {
            //@TODO
        }
    }
    
}
