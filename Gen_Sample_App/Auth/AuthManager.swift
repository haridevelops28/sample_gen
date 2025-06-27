//
//  AccountManager.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//

import Foundation
import Combine

protocol AuthProvider {
    var userID: String? { get }
    func getToken(onCompletion: @escaping(String?, Error?) -> Void)
    func refreshToken(onCompletion: @escaping(String?, Error?) -> Void)
}

protocol AuthManager {
    func login(userName: String, password: String, onComplete: @escaping(Bool, Error?) -> Void)
    func restoreSession()
    func logout()
    var isLoggedIn: Bool { get }
}


class AuthManagerImpl: AuthManager {
    
    private var token: String? // This can be a secstring, with persistance to keychain etc
    var isLoggedIn: Bool {
        token != nil && userID != nil
    }
    
    private(set) var userID: String? = nil
    
    
    func login(userName: String, password: String, onComplete completionBlock: @escaping (Bool, Error?) -> Void) {
        self.token = "token"
        self.userID = Demo.sampleProfile.userId
        completionBlock(true, nil)
    }
    
    func restoreSession() {
        // restore items from keychain
        //if exist set token and and userID.. else leave it as such
    }
    
    func logout() {
        // NOT PART OF THE EXERCISE
        token = nil
        userID = nil
    }
    
}

extension AuthManagerImpl: AuthProvider {
    func getToken(onCompletion: @escaping (String?, (any Error)?) -> Void) {
        // check if existing token is valid and return it, else refresh and return it. These are dummy implementations
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            onCompletion("token", nil)
        }
    }
    
    func refreshToken(onCompletion: (String?, (any Error)?) -> Void) {
        // logic to refresh token, and store it.
        onCompletion("new_token", nil)
    }
}
