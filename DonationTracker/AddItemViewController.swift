//
//  AddItemViewController.swift
//  DonationTracker
//
//  Created by Kelly on 12/7/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var shortDescField: UITextField!
    @IBOutlet weak var fullDescField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var time = ""
    
    let categoryStrings = ["Clothing", "Hat", "Kitchen", "Electronics", "Household", "Other"]
    let categories = [Category.CLOTHING, Category.HAT, Category.KITCHEN, Category.ELECTRONICS, Category.HOUSEHOLD, Category.OTHER]
    
    var selectedCategory = Category.CLOTHING
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let item = Item(location: Model.shared.getCurrentLocation(), shortDescription: shortDescField.text!, fullDescription: fullDescField.text!, value: Int(valueField.text!)!, category: selectedCategory, time: time)
        
        Model.shared.addItem(item: item)
        
        self.performSegue(withIdentifier: "unwindToItemListScreen", sender: self)
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let strDate = dateFormatter.string(from: timePicker.date)
        timeLabel.text = strDate
        time = strDate
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return categories.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedCategory = categories[row]
        return categoryStrings[row]
    }
    
}
