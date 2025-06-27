//
//  RecipientsView.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/26/25.
//

import SwiftUI
import Combine

@Observable
class RecipientsListViewModel {
    private let profileManager: UserProfileManager
    private var cancellables: Set<AnyCancellable> = []
    
    private(set) var recipients: [Recipient] = []
    
    init(profileManager: UserProfileManager) {
        self.profileManager = profileManager
        cancellables = Set<AnyCancellable>()
        self.profileManager.userProfile.sink { [weak self] profile in
            guard profile != nil else { return }
            self?.getRecipientsList()
        }.store(in: &self.cancellables)
    }
    
    private func getRecipientsList() {
        profileManager.getSavedRecipients { [weak self] recipients, error in
            DispatchQueue.main.async {
                self?.recipients = recipients
//                print("reciepients set \(self?.recipients.count)")
            }
        }
    }
}

public struct RecipientsView: View {
    var size: CGFloat {
        return (UIScreen.main.bounds.width - 16) / 5 - 16
    }
    
    @State private var viewModel: RecipientsListViewModel
    
    init(viewModel: RecipientsListViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        let recipients = self.viewModel.recipients
        let recipientsToShow = recipients.count > 4 ? Array(recipients[0..<4]) : recipients
        let otherRecipientsCount = recipients.count - 4
        return VStack(alignment: .leading, spacing: 8) {
            Text(NSLocalizedString("Recipients", comment: "Recipeients"))
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(recipientsToShow, id: \.name) { recipient in
                        UserAvatarView(recipient: recipient)
                    }
                    if otherRecipientsCount == 1 {
                        UserAvatarView(recipient: recipients[4])
                    } else if otherRecipientsCount > 1 {
                        ZStack {
                            UserAvatarView(recipient: recipients[4], shouldshowStatus: false)
                                .overlay(Circle().foregroundColor(.black.opacity(0.5)))
                            Text("\(otherRecipientsCount - 1)+")
                                .foregroundColor(.white)
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        
                    }
                }
            }
        }.padding(EdgeInsets.init(top: 16, leading: 0, bottom: 16, trailing: 0))
    }
}


