//
//  AuthSession.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 23/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import RealmSwift

class AuthSession: Object {
    
    @objc dynamic var authHash = ""
    @objc dynamic var host = ""
    @objc dynamic var loggedUser = ""
    @objc dynamic var realName = ""
    
}
