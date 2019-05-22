//
//  Event.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 22/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//


class Event {
    
    var title: String
    var time: String
    
    init?(from json: JSON) {
        guard
            let eventTitle = json["event"] as? String,
            let eventTime = json["time"] as? String
            else {
                return nil
        }
        
        self.title = eventTitle
        self.time = eventTime
    }
    
}

