//
//  PopUpViewController.swift
//  ASFTC
//
//  Created by Роман Чулкевич on 20/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    public var loginResultMessage: String = ""
    public var loginResultImage: String = ""
    public var loginResultStatus: Bool = false
    
    @IBOutlet weak var loginResultMessageLabel: UILabel!
    @IBOutlet weak var loginResultImageView: UIImageView!
    @IBOutlet weak var messageBoxView: UIView!
    @IBOutlet weak var closePopUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageBoxView.layer.cornerRadius = 24
        
        if loginResultStatus {
            closePopUpButton.isHidden = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                self.view.removeFromSuperview()
            })
        }
        
        loginResultMessageLabel.text = loginResultMessage
        loginResultImageView.image = UIImage(named: loginResultImage)
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        self.view.removeFromSuperview()
    }
}
