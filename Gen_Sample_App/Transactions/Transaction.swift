//
//  Transaction.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//
import Foundation

enum TransactionCategory {
    case food
    case transportation
    case shopping
    case entertainment
    case health
    case savings
    case other
    
    
    var icons: String {
        switch self {
        case .food:
            return "fork.knife.circle"
        case .transportation:
            return "car.ferry"
        case .shopping:
            return "cart"
        case .entertainment:
            return "movieclapper"
        case .health:
            return "heart.circle"
        case .savings:
            return "eurosign.bank.building"
        case .other:
            return "questionmark"

        }
    }
}

enum TransactionType {
    case deposit
    case withdrawal
    case cardPayment
    case onlinePayment
    
    var displayName: String {
        switch self {
        case .deposit:
            return String(localized: "Savings")
        case .withdrawal:
            return String(localized: "Withdrawal")
        case .cardPayment:
            return String(localized: "Card Payment")
        case .onlinePayment:
            return String(localized: "Online Payment")
        }
    }
}

class Transaction {
    let id: String
    let amount: Double
    let category: TransactionCategory
    let transactionType: TransactionType
    let time: Date
    let toAccount: String
    
    init(id: String, amount: Double, category: TransactionCategory, time: Date, toAccount: String, transactionType: TransactionType) {
        self.id = id
        self.amount = amount
        self.category = category
        self.time = time
        self.toAccount = toAccount
        self.transactionType = transactionType
    }
}
