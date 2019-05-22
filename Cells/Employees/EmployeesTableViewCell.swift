//
//  UsersRecordsTableViewCell.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 23/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class EmployeesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    func setup(from employee: Employee) {
        self.titleLabel.text = employee.name
        self.bodyLabel.text = "EmployeeID: \(employee.id)"
    }
    
}
