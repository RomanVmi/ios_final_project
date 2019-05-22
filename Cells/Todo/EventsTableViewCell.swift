//
//  UsersViewController.swift
//  ASFTC
//
//  Created by Роман Чулкевич on 21/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    func setup(from event: Event) {
        self.titleLabel.text = event.title
        self.bodyLabel.text = event.time
    }
    
}
