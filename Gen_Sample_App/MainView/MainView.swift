//
//  ContentView.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/26/25.
//

import SwiftUI
import Combine

struct MainView: View {
    @State private var viewmodel = MainViewModel()
    
    var body: some View {

        if viewmodel.isLoggedIn {
            ZStack(alignment: .bottomLeading) {
                switch viewmodel.selectedTab {
                case 0:
                    HomeView(viewModel: HomeViewModel(transactionsManager: viewmodel.transactionManager, profileManager: viewmodel.profileManager))
                case 1:
                    DummyTabView(tabName: "Trends")
                default:
                    DummyTabView(tabName: "Profile")
                }
                HStack {
                    
                    CustomPageSegmentedControl(
                        selectedIndex: $viewmodel.selectedTab,
                        onChange: { index in
                            viewmodel.selectedTab = index
                        },
                        segments: [
                            .init(icon: "house", label: "Home"),
                            .init(icon: "chart.bar", label: "Trends"),
                            .init(icon: "person", label: "Profile")
                        ]
                    )
                    Spacer()
                    if viewmodel.selectedTab == 0 {
                        Button("+") {
                            print("Plus button pressed...")
                        }.frame(width: 60, height: 60)
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.8))
                            .mask(Circle())
                            .padding(.horizontal)
                        
                    }
                    
                }
                Spacer()
            }
        } else {
            VStack {
                Spacer()
                Button("Login") {
                    viewmodel.login()
                }
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .cornerRadius(8)
                Spacer()
            }
        }
        
    }
}



#Preview {
    MainView()
}


