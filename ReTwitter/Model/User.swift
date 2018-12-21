//
//  User.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/13/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
    let profileImage: UIImage
    let name: String
    let username: String
    let bio: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bio = json["bio"].stringValue
        self.profileImage = UIImage(named: "default")!
    }
}
