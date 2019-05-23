//
//  AuthSessionManager.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 23/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit
import RealmSwift

class AuthSessionManager {
    
    private var database: Realm
    static let sharedInstance = AuthSessionManager()
    
    private init() {
        database = try! Realm()
    }
    
    func getCurrentSession() -> AuthSession {
        let session = database.objects(AuthSession.self).first!
        return session
    }
    
    func isAuthorized() -> Bool {
        let session = database.objects(AuthSession.self).first
        if session != nil {
            return true
        }
        return false
    }
    
    func clearAll() -> Void {
        try! database.write {
            database.deleteAll()
        }
    }
    
    func saveCurrent(_ session: AuthSession) -> Void {
        self.clearAll()
        try! database.write {
            database.add(session)
        }
    }
    
    func deleteCurrentSession() -> Void {
        try! database.write {
            database.delete(self.getCurrentSession())
        }
    }

}
