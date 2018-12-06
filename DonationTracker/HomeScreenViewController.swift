//
//  HomeScreenViewController.swift
//  DonationTracker
//
//  Created by Kelly on 12/6/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func setupView() {
        var welcomeMessage = "Welcome, "
        let currentAccount = Model.shared.getCurrentAccount()
        welcomeMessage += currentAccount.getUsername() + " (" + currentAccount.getRole().rawValue + ")"
        
        welcomeLabel.text = welcomeMessage
        welcomeLabel.textAlignment = .center
        welcomeLabel.sizeToFit()
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
    }
    
}
