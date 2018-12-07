//
//  ItemDatabase.swift
//  DonationTracker
//
//  Created by Kelly on 12/7/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import Foundation

class ItemDatabase {
    var items: [Item]
    
    init() {
        items = [Item]()
    }
    
    func addItem(item: Item) {
        items.append(item)
    }
    
    func getItemsForLocation(location: Location) -> [Item] {
        var locItems = [Item]()
        for item in items {
            if (item.getLocation().getUniqueKey() == location.getUniqueKey()) {
                locItems.append(item)
            }
        }
        
        return locItems
    }
    
    func item(atIndex: Int) -> Item {
        return items[atIndex]
    }
}
