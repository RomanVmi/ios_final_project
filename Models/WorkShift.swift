//
//  WorkShift.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 23/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

class Worker {
    var name: String
    var workTime: String
    
    init?(from json: JSON) {
        guard
            let workerName = json["name"] as? String,
            let workerWorkTime = json["worktime"] as? String
        else {
                return nil
        }
        self.name = workerName
        self.workTime = workerWorkTime
    }
}


class WorkShift {
    
    var guards: [Worker]
    var chiefs: [Worker]
    var workers: [Worker]
    
    init?(from json: JSON) {
        
        guard
            let shiftGuards = json["guards"] as? [JSON],
            let shiftChiefs  = json["chiefs"] as? [JSON],
            let shiftWorkers = json["workers"] as? [JSON]
        else {
            return nil
        }

        self.guards = shiftGuards.compactMap{Worker(from: $0)}
        self.chiefs = shiftChiefs.compactMap{Worker(from: $0)}
        self.workers = shiftWorkers.compactMap{Worker(from: $0)}

    }
    
}
