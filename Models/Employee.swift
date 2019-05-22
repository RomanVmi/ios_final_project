//
//  UserRecord.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 23/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

class Employee {
    
    var name: String
    var id: Int
    
    init?(from json: JSON) {
        guard
            let employeeName = json["name"] as? String,
            let employeeId = json["id"] as? Int
        else {
                return nil
        }
        
        self.name = employeeName
        self.id = employeeId
    }
    
}
