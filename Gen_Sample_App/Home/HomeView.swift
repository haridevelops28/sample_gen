//
//  HomeView.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/26/25.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color(red: 224/255, green: 222/255, blue: 208/255)
                .ignoresSafeArea()
            ScrollView{
                VStack(spacing: 24) {
                    HomeWelcomeHeaderView(viewModel: HomeWelcomeSegmentViewModel(userProfileManager: viewModel.profileManager))
                    DemoTrendsView(viewModel: ChartsSegmentViewModel()).padding(.horizontal)
                    RecipientsView(viewModel: RecipientsListViewModel(profileManager: viewModel.profileManager))
                        .padding(.horizontal)
                    TransactionsListView(transactions: Demo.sampleTransactions)
                    Spacer()
                }
            }
        }
    }
}

private struct HomeWelcomeHeaderView: View {
    
    @State private var viewModel: HomeWelcomeSegmentViewModel
    
    init(viewModel: HomeWelcomeSegmentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Welcome,")
                    .font(.title3)
                    .foregroundColor(.gray)
                Text("\(viewModel.firstName ?? "")!")
                    .font(.title3)
                    .bold()
                Spacer()
                Button(action: {}) {
                    Image(systemName: "bell")
                        .font(.title2)
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            .padding(.top, 16)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray.opacity(0.4))
                .padding(.horizontal)
            
            HStack(alignment: .firstTextBaseline) {
                Text("\((viewModel.balance ?? 0.00).formatted(.currency(code: "EUR")))")
                    .font(.system(size: 32, weight: .bold))
                Text("Balance")
                    .foregroundColor(.gray)
                    .padding(.leading, 4)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "plus")
                        .padding(8)
                        .foregroundColor(Color(.darkGray))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)
            .padding(.top, 16)
        }
    }
}
