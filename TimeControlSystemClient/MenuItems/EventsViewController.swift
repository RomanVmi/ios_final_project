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
    @IBOutlet weak var tableView: UITableView!
    
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "История событий"
        
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
        EventsTableViewCell.register(for: tableView)
        updateTodos()
    }
    
    private func updateTodos() {
        API.Events().send { [weak self] (response) in
            guard let self = self else { return }
            
            if response["events"] != nil {
                let apiEvents = response["events"] as! [JSON]
                self.events = apiEvents.compactMap{ Event(from: $0 ) }
                self.tableView.reloadData()
                self.removeSpinner()
            }
        }
    }
}

extension EventsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventsTableViewCell.identifier) as! EventsTableViewCell
        let todo = self.events[indexPath.row]
        
        cell.setup(from: todo)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
