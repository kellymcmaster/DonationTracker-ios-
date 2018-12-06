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
    private var currentAccount : Account?

    
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
}
