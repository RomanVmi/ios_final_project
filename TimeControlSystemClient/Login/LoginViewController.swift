//
//  LoginViewController.swift
//  TimeControlSystemClient
//
//  Created by Роман Чулкевич on 21/05/2019.
//  Copyright © 2019 Роман Чулкевич. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var UserNameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var HostField: UITextField!
    
    func check_auth() {
        if (AuthSessionManager.sharedInstance.isAuthorized()) {
            self.present(SWRevealViewController.instance() as UIViewController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.check_auth()
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        
        let username = UserNameField.text
        let password = PasswordField.text
        let host = HostField.text;
        
        self.view.isUserInteractionEnabled = false
        self.showSpinner(onView: self.view)

        let parameters = [
            "username": username!,
            "password": password!,
        ]
        
        API.Login(with: host!, and: parameters).send { [weak self] (response) in guard let self = self else {print ("!!!"); return}

            self.removeSpinner()
            self.view.isUserInteractionEnabled = true

            var loginMessage: String = "Произошла ошибка авторизации"
            var loginImage: String = "LoginError"
            var loginStatus: Bool = false
            
            if response["auth_hash"] != nil {
                loginMessage = "Добро пожаловать, \(response["real_name"] as! String)!"
                loginImage = "LoginSuccess"
                loginStatus = true
                let session = AuthSession()
                session.authHash = response["auth_hash"] as! String
                session.realName = response["real_name"] as! String
                session.loggedUser = username!
                AuthSessionManager.sharedInstance.saveCurrent(session)
                self.PasswordField.text = ""
            }
            else
                if response["error"] != nil {
                    loginMessage = "Ошибка: \(response["error"] as! String)"
                } else {
                    loginMessage = "Ошибка: \(response)"
                }
            
            
            let popUpVC = PopUpViewController.popUpInstance(loginMessage, loginImage, loginStatus)
            self.addChild(popUpVC)
            popUpVC.view.frame = self.view.frame
            self.view.addSubview(popUpVC.view)
            popUpVC.didMove(toParent: self)
            
            if loginStatus {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                    self.check_auth()
                })
            }
        }
    }
}
