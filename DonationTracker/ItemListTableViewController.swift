//
//  ItemListTableViewController.swift
//  DonationTracker
//
//  Created by Kelly on 12/7/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import UIKit

class ItemListTableViewController: UITableViewController {
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var addItemButton: UIBarButtonItem!
    
    var items = [Item]()
    var selectedRow: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadItems()
    }
    
    private func loadItems() {
        items = Model.shared.getItemsForCurrentLocation()
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
        let item = Model.shared.item(atIndex: indexPath.row)
        cell.shortDescLabel?.text = item.getShortDescription()
        cell.categoryLabel?.text = item.getCategory().rawValue
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectedCell = sender as? UITableViewCell,
            let selectedIndex = tableView.indexPath(for: selectedCell) {
            Model.shared.setCurrentItem(item: Model.shared.item(atIndex: selectedIndex.row))
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let item = Model.shared.item(atIndex: indexPath.row)
        Model.shared.setCurrentItem(item: item)
        self.performSegue(withIdentifier: "itemDetailSegue", sender: self)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindToItemListScreen(sender: UIStoryboardSegue) {
        
    }
}
