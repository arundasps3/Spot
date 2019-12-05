//
//  CurrentUser.swift
//  Spot
//
//  Created by ARUNDAS PS on 2019-12-05.
//  Copyright © 2019 ARUNDAS PS. All rights reserved.
//

import Foundation
struct CurrentUser {
    let uid : String
    let name : String
    let email : String
    let username : String

    init(uid: String,dictionary:[String:Any])
{
    
    self.uid = uid
    self.name = dictionary["name"] as? String ?? ""
    self.email = dictionary["email"] as? String ?? ""
    self.username = dictionary["username"] as? String ?? ""
}
}
