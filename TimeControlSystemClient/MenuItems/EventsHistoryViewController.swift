//
//  EventsHistoryViewController.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 22/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "История событий"
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
}
