//
//  LocationDatabase.swift
//  DonationTracker
//
//  Created by Kelly on 12/6/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import Foundation

class LocationDatabase {
    private var locations: [String: Location]
    
    init() {
        self.locations = [String: Location]()
    }
    
    func addLocation(location: Location) {
        locations[location.getUniqueKey()] = location
    }
}
