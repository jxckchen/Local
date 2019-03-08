//
//  UserProfile.swift
//  Local
//
//  Created by Jack Chen on 3/6/19.
//  Copyright © 2019 Jack Chen. All rights reserved.
//

import Foundation

class UserProfile {
    var uid:String
    var username:String
    var photoURL:URLSession
    
    init(uid:String, username:String,photoURL:URLSession) {
        self.uid = uid
        self.username = username
        self.photoURL = photoURL
    }
}
