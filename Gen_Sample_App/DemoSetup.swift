//
//  DemoSetup.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//
import Foundation

struct Demo {
   static let sampleProfile = UserProfile(
        userId: UUID().uuidString,
        accounts: [UserAccounts(accountNo: "45678", balance: 15001.23), UserAccounts(accountNo: "91023", balance: 2504.41, accountType: "CURRENT")],
        firstName: "Hari",
        lastName: "Gurumurthy"
    )
    
   static let sampleRecipients: [Recipient] = [
        Recipient(name: "John Doe", imageURL: "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg", status: .online),
        Recipient(name: "Jane Smith", imageURL: "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg", status: .offline),
        Recipient(name: "Jim Beam", imageURL: "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg", status: .busy),
        Recipient(name: "Jill Johnson", imageURL: "https://images.pexels.com/photos/1065084/pexels-photo-1065084.jpeg", status: .online),
        Recipient(name: "James Smith", imageURL: "https://img.freepik.com/free-photo/young-man-writing-notebook_23-2148539806.jpg?semt=ais_items_boosted&w=740", status: .busy),
        Recipient(name: "Maggie Smith", imageURL: nil, status: .online)
        ]
    
    static let sampleTransactions: [Transaction] = [
        Transaction(id: "1101", amount: 15.0, category: .food, time: .now, toAccount: "Starbucks", transactionType: .cardPayment),
        Transaction(id: "1098", amount: 450.0, category: .savings, time: .now.addingTimeInterval(-1 * 60 * 4), toAccount: "Starbucks", transactionType: .deposit),
        Transaction(id: "1092", amount: 2.0, category: .transportation, time: .now.advanced(by: -1 * 60 * 5), toAccount: "TFI", transactionType: .onlinePayment),
        Transaction(id: "1000", amount: 100.0, category: .health, time: .now.addingTimeInterval(-1 * 60 * 30), toAccount: "Connolly Health Centre",transactionType: .withdrawal),
        Transaction(id: "994", amount: 15.0, category: .shopping, time: .now.addingTimeInterval(-24 *  60 * 10 * 60), toAccount: "Tesco", transactionType: .cardPayment),
    ]
}
