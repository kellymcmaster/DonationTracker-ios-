//
//  LocationListTableViewController.swift
//  DonationTracker
//
//  Created by Kelly on 12/6/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import UIKit

class LocationListTableViewController: UITableViewController {
    @IBOutlet weak var backButton: UIButton!
    var locations = [Location]()
    var selectedRow: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLocations()
        tableView.dataSource = self
    }
    
    private func loadLocations() {
        locations = Model.shared.getLocationsList()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell", for: indexPath) as! LocationTableViewCell
        let location = Model.shared.location(atIndex: indexPath.row)
        cell.nameLabel?.text = location.getName()
        cell.addressLabel?.text = location.getAddress()
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectedCell = sender as? UITableViewCell,
            let selectedIndex = tableView.indexPath(for: selectedCell) {
            Model.shared.setCurrentLocation(location: Model.shared.location(atIndex: selectedIndex.row))
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let location = Model.shared.location(atIndex: indexPath.row)
        print(location.getName())
        Model.shared.setCurrentLocation(location: location)
        self.performSegue(withIdentifier: "locationDetailSegue", sender: self)
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
