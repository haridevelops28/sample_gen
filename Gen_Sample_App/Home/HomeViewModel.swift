//
//  HomeViewModel.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//

import Foundation
import Combine

@Observable
class HomeViewModel {
    let transactionsManager: TransactionsManager
    let profileManager: UserProfileManager
    
    init(transactionsManager: TransactionsManager, profileManager: UserProfileManager) {
        self.transactionsManager = transactionsManager
        self.profileManager = profileManager
    }
    
}

class HomeWelcomeSegmentViewModel: ObservableObject {
    
    @Published var firstName: String?
    @Published var balance: Double?
    
    private let userProfileManager: UserProfileManager
    private var allCancellables: Set<AnyCancellable>

    init(userProfileManager: UserProfileManager) {
        self.userProfileManager = userProfileManager
        self.allCancellables = Set<AnyCancellable>()
        userProfileManager.userProfile.sink { profile in
            guard let profile = profile else { return }
            self.firstName = profile.firstName
            self.balance = profile.getBalance(forAccountNo: profile.accountNos.first!)
        }.store(in: &allCancellables)
    }
}
