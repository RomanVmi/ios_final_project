//
//  MarkWorkerViewController.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 22/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class MarkWorkerViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var employees = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Ручная отметка сотрудников"
        
        self.showSpinner(onView: self.view);
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
         setup()
    }
   

    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        EmployeesTableViewCell.register(for: tableView)
        updateWorkers()
    }

    private func updateWorkers() {
        API.Employees().send { [weak self] (response) in
            guard let self = self else { return }
            
            if response["employees"] != nil {
                let apiEmployees = response["employees"] as! [JSON]
                self.employees = apiEmployees.compactMap{ Employee(from: $0 ) }
                self.tableView.reloadData()
                self.removeSpinner()
            }
        }
    }

}

extension MarkWorkerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeesTableViewCell.identifier) as! EmployeesTableViewCell
        let employee = self.employees[indexPath.row]
        cell.setup(from: employee)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    
}
