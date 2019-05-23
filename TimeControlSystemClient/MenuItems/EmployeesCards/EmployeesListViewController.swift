//
//  EmployeeCardsViewController.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 22/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class EmployeesListViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var employees = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Карточки сотрудников"
        
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
        updateTodos()
    }
    
    private func updateTodos() {
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

extension EmployeesListViewController: UITableViewDataSource, UITableViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let parameters = [
            "user_id": self.employees[indexPath.row].id
        ]
        self.showSpinner(onView: self.view);
        API.EmployeeCard(with: parameters).send { [weak self] (response) in
            guard let self = self else { return }
            if response["employee_card"] != nil {
                self.removeSpinner()
                let employee = EmployeeCard(from: response["employee_card"] as! JSON)
                let employeeCard = EmployeeCardViewController.cardInstance(employee!)
                self.navigationController?.pushViewController(employeeCard, animated: true)
            }
        }
        
    }
    
}
