//
//  AccountDatabase.swift
//  DonationTracker
//
//  Created by Kelly on 12/5/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import Foundation

class AccountDatabase {
    private var accounts: [String: Account]
    
    init() {
        self.accounts = [String: Account]()
    }

    func containsAccount(username: String) -> Bool {
        if (self.accounts[username] != nil) {
            return true
        } else {
            return false
        }
    }

    func addAccount(account: Account) {
        self.accounts[account.getUsername()] = account
    }
    
    func validatePassword(username: String, password: String) -> Bool {
        return (accounts[username]!).validatePassword(password: password)
    }
    
    func getAccount(username: String) -> Account {
        return self.accounts[username]!
    }
}
