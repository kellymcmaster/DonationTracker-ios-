//
//  Item.swift
//  DonationTracker
//
//  Created by Kelly on 12/7/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import Foundation

class Item {
    var location: Location
    var shortDescription: String
    var fullDescription: String
    var value: Int
    var category: Category
    
    init(location: Location, shortDescription: String, fullDescription: String, value: Int, category: Category) {
        self.location = location
        self.shortDescription = shortDescription
        self.fullDescription = fullDescription
        self.value = value
        self.category = category
    }
    
    func getLocation() -> Location {
        return location
    }
    
    func getShortDescription() -> String {
        return shortDescription
    }
    
    func getFullDescription() -> String {
        return fullDescription
    }
    
    func getValue() -> Int {
        return value
    }
    
    func getCategory() -> Category {
        return category
    }
}
