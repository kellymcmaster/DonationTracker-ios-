//
//  RegisterScreenViewController.swift
//  DonationTracker
//
//  Created by Kelly on 12/5/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import UIKit

class RegisterScreenViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var roleSelector: UISegmentedControl!
    
    private var roleSelection = AccountRole.GENERAL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    fileprivate func setupView() {
        self.errorLabel.isHidden = true
    }
    
    @IBAction func roleSelectorPressed(_ sender: Any) {
        switch roleSelector.selectedSegmentIndex
        {
        case 0:
            roleSelection = AccountRole.GENERAL
        case 1:
            roleSelection = AccountRole.LOCATION_EMPLOYEE
        case 2:
            roleSelection = AccountRole.MANAGER
        case 3:
            roleSelection = AccountRole.ADMIN
        default:
            break
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
            self.performSegue(withIdentifier: "unwindToMainScreen", sender: self)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        let success = Model.shared.register(username: self.usernameField.text!, password: self.passwordField.text!, role: roleSelection)
        
        if (success) {
            self.performSegue(withIdentifier: "unwindToMainScreen", sender: self)
        } else {
            self.errorLabel.isHidden = success
        }
    }
}
