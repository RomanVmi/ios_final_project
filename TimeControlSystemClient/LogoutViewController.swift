//
//  LogoutViewController.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 22/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AuthSessionManager.sharedInstance.deleteCurrentSession()
        self.dismiss(animated: true, completion: nil)
    }

}
