//
//  UsersViewController.swift
//  ASFTC
//
//  Created by Роман Чулкевич on 21/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class WorkShiftViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Текущая смена"
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
}
