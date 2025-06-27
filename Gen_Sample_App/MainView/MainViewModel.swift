//
//  MainViewModel.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//

import Foundation
import Combine

@Observable
class MainViewModel {
    private let authManager = AuthManagerImpl()
    
    private(set) var profileManager: UserProfileManager
    private(set) var transactionManager: TransactionsManager
    private var cancellables: Set<AnyCancellable> = []
    
    var isLoggedIn: Bool = false
    var selectedTab = 0 {
        didSet {
            print("Tab switched to: \(selectedTab)")
        }
    }
   
    init() {
        profileManager = ProfileManagerImpl(authProvider: authManager)
        transactionManager = TransactionManagerImpl(authProvider: authManager)
        authManager.restoreSession()
        if authManager.isLoggedIn {
            self.isLoggedIn = true
            self.selectedTab = 0
        }
    }
    
    func login() {
        authManager.login(userName: "dummy@gmail.com", password: "dummy") { _, _ in
            DispatchQueue.main.async { [weak self] in
                self?.profileManager.getUserProfile()
                self?.isLoggedIn = true
            }
        }
    }
}
