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
        self.setupUsers(json: json)
        self.setupTweets(json: json)
    }
    
    fileprivate func setupUsers(json: JSON) {
        let usersResponse = json["users"].array
        for userObject in usersResponse! {
            let user = User(profileImage: UIImage(named: "default")!, name: userObject["name"].stringValue, username: userObject["username"].stringValue, bio: userObject["bio"].stringValue)
            self.users.append(user)
        }
    }
    
    fileprivate func setupTweets(json: JSON) {
        let tweetsResponse = json["tweets"].array
        for tweetObject in tweetsResponse! {
            let user = User(profileImage: UIImage(named: "default")!, name: tweetObject["user"]["name"].stringValue, username: tweetObject["user"]["username"].stringValue, bio: tweetObject["user"]["bio"].stringValue)
            let message = tweetObject["message"].stringValue
            let tweet = Tweet(user: user, message: message)
            tweets.append(tweet)
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
