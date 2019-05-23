//
//  EmployeesTableSmallViewCell.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 23/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class EmployeesTableSmallViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(from employee: Employee) {
        self.titleLabel.text = employee.name
    }
    
}
