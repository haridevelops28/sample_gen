//
//  RecipientUser.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/26/25.
//

import Foundation
import SwiftUI

enum UserStatus {
    case online
    case offline
    case busy
    
    var statusColor: Color {
        switch self {
        case .online:
            return .green
        case .offline:
            return .gray.opacity(0.7)
        case .busy:
            return .red
        }
    }
}

class Recipient: ObservableObject {
    let name: String
    @Published var imageURL: String?
    @Published var status: UserStatus
    
    init(name: String, imageURL: String?, status: UserStatus = .offline) {
        self.name = name
        self.imageURL = imageURL
        self.status = status
    }
}
