//
//  UserProfile.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//

import Foundation

class UserAccounts {
    let accountNo: String
    let balance: Double
    let accountType: String
    
    init(accountNo: String, balance: Double, accountType: String = "SAVINGS") {
        self.accountNo = accountNo
        self.balance = balance
        self.accountType = accountType
    }
}

class UserProfile {
    let userId: String
    private let accounts: [UserAccounts]
    let firstName: String
    let lastName: String
    let imageUrl: String?
    // can be extended for a few more
    var accountNos: [String] {
        return accounts.map(\.self.accountNo)
    }
    
    init(userId: String, accounts: [UserAccounts], firstName: String, lastName: String, imageUrl: String? = nil) {
        self.userId = userId
        self.accounts = accounts
        self.firstName = firstName
        self.lastName = lastName
        self.imageUrl = imageUrl
    }
    
    func getBalance(forAccountNo accountNo: String) -> Double? {
        return accounts.first(where: { $0.accountNo == accountNo })?.balance
    }
}

