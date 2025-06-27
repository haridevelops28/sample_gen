//
//  TransactionsManager.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//

import Foundation

protocol TransactionsManager {
    func transact(amount: Double, to account: String, onCompletion: @escaping (Bool, Error?) -> Void)
    func getAllTransactions(onCompletion: @escaping ([Transaction], Error?) -> Void)
}

class TransactionManagerImpl: TransactionsManager {
  
    private let authProvider: AuthProvider
    
    init(authProvider: AuthProvider) {
        self.authProvider = authProvider
    }
        
    func transact(amount: Double, to account: String, onCompletion: (Bool, (any Error)?) -> Void) {
        guard Double(amount) > 0 else {
            onCompletion(false, TransactionError.invalidAmount)
            return
        }
        // :
        // :
        // API Call to be made
        onCompletion(true, nil)
    }
    
    func getAllTransactions(onCompletion: @escaping ([Transaction], (any Error)?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            onCompletion(Demo.sampleTransactions, nil)
        }
        // dummy method.
    }
    
}

enum TransactionError: Error {
    case invalidAmount
    case invalidAccount
    case serverError
    case insufficientFunds
}
