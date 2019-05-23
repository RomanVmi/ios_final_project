//
//  UsersViewController.swift
//  ASFTC
//
//  Created by Роман Чулкевич on 21/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class WorkShiftViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var workShift: WorkShift?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Текущая смена"
        
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
        WorkShiftTableViewCell.register(for: tableView)
        let headerNib = UINib.init(nibName: "PositionHeaderCustomView", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "PositionHeaderCustomView")
        updateWorkShift()
    }
    
    private func updateWorkShift() {
        API.WorkShift().send { [weak self] (response) in
            guard let self = self else { return }
            
            if response["work_shift"] != nil {
                self.workShift = WorkShift(from: response["work_shift"] as! JSON)
                self.tableView.reloadData()
                self.removeSpinner()
            }
        }
    }
}

extension WorkShiftViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0: return self.workShift?.guards.count ?? 0
            case 1: return self.workShift?.chiefs.count ?? 0
            default: return self.workShift?.workers.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkShiftTableViewCell.identifier) as! WorkShiftTableViewCell
        let worker: Worker
        switch indexPath.section {
            case 0: worker = self.workShift!.guards[indexPath.row]
            case 1: worker = self.workShift!.chiefs[indexPath.row]
            default: worker = self.workShift!.workers[indexPath.row]
        }
        cell.setup(from: worker)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PositionHeaderCustomView") as! PositionHeaderCustomView
        
        var sectionName: String
        var sectionImage: UIImage
        
        switch section {
            case 0: do {
                sectionName = "ОХРАННИКИ"
                sectionImage = UIImage(named: "Guard")!
            }
            case 1: do {
                sectionName = "НАЧАЛЬНИКИ"
                sectionImage = UIImage(named: "Chief")!
            }
            case 2: do {
                sectionName = "РАБОЧИЕ"
                sectionImage = UIImage(named: "Worker")!
            }
            default: do {
                sectionName = "Остальные сотрудники"
                sectionImage = UIImage(named: "Statistic")!
            }
        }
        
        headerView.title.text = sectionName
        headerView.image.image = sectionImage
        return headerView
    }
    
}
