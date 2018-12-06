//
//  Location.swift
//  DonationTracker
//
//  Created by Kelly on 12/6/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import Foundation

class Location {
    private var uniqueKey: String
    private var name: String
    private var latitude: String
    private var longitude: String
    private var streetAddress: String
    private var city: String
    private var state: String
    private var zip: String
    private var type: String
    private var phone: String
    private var website: String
    private var address: String
    
    init(uniqueKey: String, name: String, latitude: String, longitude: String, streetAddress: String, city: String, state: String, zip: String, type: String, phone: String, website: String, address: String) {
        self.uniqueKey = uniqueKey
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zip = zip
        self.type = type
        self.phone = phone
        self.website = website
        self.address = streetAddress + ", " + city + ", " + state + ", " + zip
    }
    
    func getUniqueKey() -> String {
        return self.uniqueKey
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getLatitude() -> String {
        return self.latitude
    }
    
    func getLongitude() -> String {
        return self.longitude
    }
    
    func getStreetAddress() -> String {
        return self.streetAddress
    }
    
    func getCity() -> String {
        return self.city
    }
    
    func getState() -> String {
        return self.state
    }
    
    func getZip() -> String {
        return self.zip
    }
    
    func getType() -> String {
        return self.type
    }
    
    func getPhone() -> String {
        return self.phone
    }
    
    func getWebsite() -> String {
        return self.website
    }
    
    func getAddress() -> String {
        return self.address
    }
}
