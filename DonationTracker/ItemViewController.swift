//
//  ItemViewController.swift
//  DonationTracker
//
//  Created by Kelly on 12/7/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var shortDescLabel: UILabel!
    @IBOutlet weak var fullDescLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    private func setupView() {
        item = Model.shared.getCurrentItem()
        shortDescLabel.text = (shortDescLabel.text ?? "") + (item?.getShortDescription() ?? "")
        fullDescLabel.text = (fullDescLabel.text ?? "") + (item?.getFullDescription() ?? "")
        valueLabel.text = (valueLabel.text ?? "") + "\((item!).getValue())"
        categoryLabel.text = (categoryLabel.text ?? "") + (item?.getCategory().rawValue ?? "")
        //timeLabel.text = item?.getTime()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
