//
//  LocationDatabase.swift
//  DonationTracker
//
//  Created by Kelly on 12/6/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import Foundation

class LocationDatabase {
    private var locations: [Location]
    
    init() {
        self.locations = [Location]()
    }
    
    func addLocation(location: Location) {
        locations.append(location)
    }
    
    func getLocations() -> [Location] {
        var locationList: [Location] = []
        for location in locations {
            locationList.append(location)
        }
        return locationList
    }
    
    func location(atIndex index: Int) -> Location {
        return self.locations[index]
    }
    
    func location(withKey: String) -> Location {
        for location in locations {
            if (location.getUniqueKey() == withKey) {
                return location
            }
        }
        return locations[0]
    }
}
