//
//  ProfileManager.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//
import Foundation
import Combine

protocol UserProfileManager {
    var userProfile: CurrentValueSubject<UserProfile?, Never> { get }
    func getUserProfile()
    func getSavedRecipients(onCompletion: @escaping ([Recipient], Error?) -> Void)
    func updateUserProfile(_ userProfile: UserProfile)
    func getBalance(accountNo: String) -> Double?
}

class ProfileManagerImpl: UserProfileManager {
    
    private let authProvider: AuthProvider
    
    init(authProvider: AuthProvider) {
        self.authProvider = authProvider
    }
    
    var userProfile: CurrentValueSubject<UserProfile?, Never> = .init(nil)

    func getUserProfile() {
        self.updateUserProfile(Demo.sampleProfile)
    }
    
    func updateUserProfile(_ userProfile: UserProfile) {
        self.userProfile.value = userProfile
    }

    func getSavedRecipients(onCompletion: @escaping ([Recipient], Error?) -> Void) {
        onCompletion(Demo.sampleRecipients, nil)
    }
    
    func getBalance(accountNo: String) -> Double? {
        return userProfile.value?.getBalance(forAccountNo: accountNo)
    }
}
