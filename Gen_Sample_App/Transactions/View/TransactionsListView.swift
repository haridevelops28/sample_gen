
//
//  TransactionsListView.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//

import SwiftUI

public struct TransactionsListView: View {
    private let transactions: [Transaction]
    private var transactionsToShow: [Transaction]
    
    init(transactions: [Transaction]) {
        self.transactions = transactions
        self.transactionsToShow = transactions.filter { Calendar.current.isDateInToday($0.time)}
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Transactions history")
                                .font(.headline)
                            Spacer()
                            Text("Today")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        VStack(spacing: 12) {
                            ForEach(transactionsToShow, id: \.id) { transaction in
                                TransactionListItemView(transaction: transaction)
                            }
                        }
                    }
        .padding(.horizontal)
    }
}



