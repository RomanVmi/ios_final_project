//
//  WorkShiftCellView.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 23/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class WorkShiftTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    func setup(from worker: Worker) {
        self.titleLabel.text = worker.name
        self.bodyLabel.text = "На работе с: \(worker.workTime)"
    }
    
}
