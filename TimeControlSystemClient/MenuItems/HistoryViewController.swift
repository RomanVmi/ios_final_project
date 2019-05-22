//
//  HistoryViewController.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 22/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var detailedButton: UIButton!
    @IBOutlet weak var showDayStatistics: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var totalInlabel: UILabel!
    @IBOutlet weak var totalOutLabel: UILabel!
    @IBOutlet weak var dayShiftsLabel: UILabel!
    @IBOutlet weak var totalHoursLabel: UILabel!
    @IBOutlet weak var salaryAtDay: UILabel!
    
    private var totalInlabelBasic: String!
    private var totalOutLabelBasic: String!
    private var dayShiftsLabelBasic: String!
    private var totalHoursLabelBasic: String!
    private var salaryAtDayBasic: String!
    
    @IBAction func showStatisticsButtonAction(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var textDate = dateFormatter.string(from: datePicker.date)
        
        let parameters = [
            "date": textDate
        ]
        
        self.showSpinner(onView: self.view);
        
        API.History(with: parameters).send { [weak self] (response) in guard let self = self else {return}
            
            if response["info"] != nil {
                let info = response["info"] as! JSON
                self.totalInlabel.text = "\(self.totalInlabelBasic as! String)\t\(info["total_in"] as! String)"
                self.totalOutLabel.text = "\(self.totalOutLabelBasic as! String)\t\(info["total_out"] as! String)"
                self.dayShiftsLabel.text = "\(self.dayShiftsLabelBasic as! String)\t\(info["shifts"] as! String)"
                self.totalHoursLabel.text = "\(self.totalHoursLabelBasic as! String)\t\(info["total_hours"] as! String)"
                self.salaryAtDay.text = "\(self.salaryAtDayBasic as! String)\t\(info["salary"] as! String)"
            }
            
            self.removeSpinner()
        }
        
        showDayStatistics.isHidden = true
        detailedButton.isHidden = false
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        showDayStatistics.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Статистика по дням"
        
        totalInlabelBasic = totalInlabel.text
        totalOutLabelBasic = totalInlabel.text
        dayShiftsLabelBasic = dayShiftsLabel.text
        totalHoursLabelBasic = totalHoursLabel.text
        salaryAtDayBasic = salaryAtDay.text
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
}
