//
//  TransactionListItemView.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//

import SwiftUI
import Foundation

struct TransactionListItemView: View {
    
    private let transaction: Transaction
    
    init(transaction: Transaction) {
        self.transaction = transaction
    }
    
    var body: some View {
        HStack {
            Image(systemName: transaction.category.icons).bold().foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(Color(.black.opacity(0.8)))
                .clipShape(RoundedRectangle(cornerRadius: 4.0))
            VStack(alignment: .leading, spacing: 8) {
                Text(transaction.toAccount)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(transaction.transactionType.displayName)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("\(transaction.transactionType == TransactionType.deposit ? "+" : "-") \(transaction.amount.formatted(.currency(code: "EUR")))")
                .fontWeight(.semibold)
                .foregroundColor(transaction.transactionType == TransactionType.deposit ? .black.opacity(0.7): .gray)

        }
    }
}

