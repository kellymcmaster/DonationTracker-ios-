//
//  Model.swift
//  DonationTracker
//
//  Created by Kelly on 12/5/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import Foundation

class Model {
    
    static let shared = Model()
    private let accountDb = AccountDatabase()
    private let locationDb = LocationDatabase()
    private let itemDb = ItemDatabase()
    private var currentAccount : Account?
    private var currentLocation: Location?
    private var currentItem: Item?
    
    init() {}
    
    func register(username: String, password: String, role: AccountRole) -> Bool {
        if (!accountDb.containsAccount(username: username)) {
            accountDb.addAccount(account: Account(username: username, password: password, role: role))
            return true
            } else {
            return false
        }
    }
    
    func login(username: String, password: String) -> Bool {
        let accountExists = accountDb.containsAccount(username: username)
        if (accountExists) {
            let success = accountDb.validatePassword(username: username, password: password)
            if (success) {
                currentAccount = accountDb.getAccount(username: username)
                return true
            }
        }
        return false
    }
    
    func getCurrentAccount() -> Account {
        return self.currentAccount!
    }
    
    func addLocation(location: Location) {
        self.locationDb.addLocation(location: location)
    }
    
    func setCurrentLocation(location: Location) {
        self.currentLocation = location
    }
    
    func getLocationsList() -> [Location] {
        return locationDb.getLocations()
    }
    
    func location(atIndex: Int) -> Location {
        return locationDb.location(atIndex: atIndex)
    }
    
    func location(withKey: String) -> Location {
        return locationDb.location(withKey: withKey)
    }
    
    func getCurrentLocation() -> Location {
        return currentLocation!
    }
    
    func addItem(item: Item) {
        itemDb.addItem(item: item)
    }
    
    func getItemsForCurrentLocation() -> [Item] {
        return itemDb.getItemsForLocation(location: self.currentLocation!)
    }
    
    func setCurrentItem(item: Item) {
        self.currentItem = item
    }
    
    func getCurrentItem() -> Item {
        return self.currentItem!
    }
    
    func item(atIndex: Int) -> Item {
        return itemDb.item(atIndex: atIndex)
    }
}
