//
//  EmployeeCardsViewController.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 22/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class EmployeeCardsViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBAction func showPerson(_ sender: Any) {
        let personCard = PersonViewController.cardInstance("1", "2", "3", "4", "5", "6", "7")
        self.navigationController?.pushViewController(personCard, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Карточки сотрудников"
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

}
