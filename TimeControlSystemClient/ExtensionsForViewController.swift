var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}

extension UIViewController {
    static func instance() -> UIViewController {
        let name = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: name)
        return viewController
    }
}

extension UIViewController {
    static func popUpInstance(_ loginResultMessage: String, _ loginResultImage: String, _ loginResultStatus: Bool) -> UIViewController {
        
        let name = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController: PopUpViewController = storyboard.instantiateViewController(withIdentifier: name) as! PopUpViewController
        
        viewController.loginResultMessage = loginResultMessage
        viewController.loginResultImage = loginResultImage
        viewController.loginResultStatus = loginResultStatus
        
        return viewController
    }
}

extension UIViewController {
    static func cardInstance(
            _ id: String,
            _ surname: String,
            _ mainname: String,
            _ patronym: String,
            _ position: String,
            _ lastIn: String,
            _ lastOut: String
        ) -> UIViewController {
        
        let name = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController: PersonViewController = storyboard.instantiateViewController(withIdentifier: name) as! PersonViewController
        
        viewController.pcardID = id
        viewController.psurname = surname
        viewController.pname = mainname
        viewController.ppatronym = patronym
        viewController.pposition = position
        viewController.plastIn = lastIn
        viewController.plastOut = lastOut
        
        return viewController
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
