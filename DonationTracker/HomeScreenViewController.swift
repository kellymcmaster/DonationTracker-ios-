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
        welcomeMessage += currentAccount.getUsername()
        
        welcomeLabel.text = welcomeMessage
        welcomeLabel.textAlignment = .center
        welcomeLabel.sizeToFit()
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
    }
    
    func readme() throws -> String{
        // stuff in here including a error type
        let myData =  try? readme()
        if myData == nil {
            //error handling here
        }
    }
    
    func readDataFromFile(file:String)-> String!{
        guard let filepath = Bundle.mainBundle.pathForResource(file, ofType: "csv")
            else {
                return nil
        }
        do {
            let contents = try String(contentsOfFile: filepath, usedEncoding: nil)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
    
}
