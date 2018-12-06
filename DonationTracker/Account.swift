//
//  Account.swift
//  DonationTracker
//
//  Created by Kelly on 12/5/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import Foundation

class Account {
    private var username: String
    private var password: String
    private var role: AccountRole
    
    init(username: String, password: String, role:AccountRole) {
        self.username = username
        self.password = password
        self.role = role
    }
    
    func getUsername() -> String {
        return self.username;
    }
    
    func getRole() -> AccountRole {
        return self.role
    }
    
    func validatePassword(password: String) -> Bool {
        if (self.password == password) {
            return true
        } else {
            return false
        }
    }
    
}
