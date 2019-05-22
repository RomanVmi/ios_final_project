//
//  User.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 22/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

class EmployeeCard {
    
    var cardId: String
    var surname: String
    var name: String
    var patronym: String
    var position: String
    var lastIn: String
    var lastOut: String
    var photo: String
    
    init?(from json: JSON) {
        guard
            let userPhoto = json["photo"] as? String,
            let cardId = json["user_id"] as? String,
            let userSurname = json["surname"] as? String,
            let userName = json["name"] as? String,
            let userPatronym = json["patronym"] as? String,
            let userPosition = json["position"] as? String,
            let userLastIn = json["last_in"] as? String,
            let userLastOut = json["last_out"] as? String
        
            else {
                return nil
            }
        
        self.photo = userPhoto
        self.cardId = cardId
        self.surname = userSurname
        self.name = userName
        self.patronym = userPatronym
        self.position = userPosition
        self.lastIn = userLastIn
        self.lastOut = userLastOut
        
    }
}
