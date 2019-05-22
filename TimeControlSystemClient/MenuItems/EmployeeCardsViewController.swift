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
    @IBOutlet weak var tableView: UITableView!
    
    var usersRecords = [Employee]()
    
    @IBAction func showPerson(_ sender: Any) {
        //let personCard = PersonViewController.cardInstance("1", "2", "3", "4", "5", "6", "7")
        //self.navigationController?.pushViewController(personCard, animated: true)
    }
    
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
        API.UsersRecords().send { [weak self] (response) in
            guard let self = self else { return }
            
            if response["records"] != nil {
                let apiUsersRecords = response["records"] as! [JSON]
                self.usersRecords = apiUsersRecords.compactMap{ Employee(from: $0 ) }
                self.tableView.reloadData()
                self.removeSpinner()
            }
        }
    }

}

extension EmployeeCardsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeesTableViewCell.identifier) as! EmployeesTableViewCell
        let userRecord = self.usersRecords[indexPath.row]
        
        cell.setup(from: userRecord)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userID = self.usersRecords[indexPath.row].id
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}
