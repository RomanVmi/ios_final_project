//
//  PersonViewController.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 22/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var cardID: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var mainname: UILabel!
    @IBOutlet weak var patronym: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var lastIn: UILabel!
    @IBOutlet weak var lastOut: UILabel!
    
    public var employee: EmployeeCard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        photo.image = UIImage(named: "LoginSuccess")
        cardID.text! += "\t\(employee.cardId)"
        surname.text! += "\t\(employee.surname)"
        mainname.text! += "\t\(employee.name)"
        patronym.text! += "\t\(employee.patronym)"
        position.text! += "\t\(employee.position)"
        lastIn.text! += "\t\(employee.lastIn)"
        lastOut.text! += "\t\(employee.lastOut)"
        
    }
    
    @IBAction func DeletePersonCard(_ sender: Any) {
        //self.navigationController?.popViewController(animated: true)
    }
    

}
