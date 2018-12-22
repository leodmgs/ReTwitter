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

extension Collection where Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map{ try T(json: $0) }
    }
}

class HomeDatasource: Datasource, JSONDecodable {
    
    var users: [User] = []
    var tweets: [Tweet] = []
    
    required init(json: JSON) throws {
        super.init()
        guard let usersResponse = json["users"].array, let tweetsResponse = json["tweets"].array else {
            throw NSError(domain: "com.retwitter", code: 1, userInfo: [NSLocalizedDescriptionKey: "Error while parsing JSON"])
        }
        
        self.users = try usersResponse.decode()
        self.tweets = try tweetsResponse.decode()
        
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
    
}
