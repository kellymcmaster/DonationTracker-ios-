//
//  LocationViewController.swift
//  DonationTracker
//
//  Created by Kelly on 12/6/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    var location: Location?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    private func setupView() {
        location = Model.shared.getCurrentLocation()
        self.nameLabel.text = location?.getName()
        self.typeLabel.text = location?.getType()
        self.latitudeLabel.text = location?.getLatitude()
        self.longitudeLabel.text = location?.getLongitude()
        self.addressLabel.text = location?.getAddress()
        self.phoneLabel.text = location?.getPhone()
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
