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
    
    public var pphoto: UIImage!
    public var pcardID: String!
    public var psurname: String!
    public var pname: String!
    public var ppatronym: String!
    public var pposition: String!
    public var plastIn: String!
    public var plastOut: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        photo.image = UIImage(named: "LoginSuccess")
        cardID.text! += "\t\(pcardID as String)"
        surname.text! += "\t\(psurname as String)"
        mainname.text! += "\t\(pname as String)"
        patronym.text! += "\t\(ppatronym as String)"
        position.text! += "\t\(pposition as String)"
        lastIn.text! += "\t\(plastIn as String)"
        lastOut.text! += "\t\(plastOut as String)"
        
    }
    
    @IBAction func ClosePersonCard(_ sender: Any) {
        //self.navigationController?.popViewController(animated: true)
    }
    

}
