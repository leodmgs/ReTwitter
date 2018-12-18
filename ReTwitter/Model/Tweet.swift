//
//  Tweet.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/17/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import LBTAComponents

struct Tweet {
    let user: User
    let message: String
    
    init(user: User, message: String) {
        self.user = user
        self.message = message
    }
}
