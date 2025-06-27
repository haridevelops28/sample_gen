//
//  UserAvatarView.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/26/25.
//

import SwiftUI

public struct UserAvatarView: View {
    
    var size: CGFloat {
        return (UIScreen.main.bounds.width - 16) / 5 - 16
    }
    
    private let imageURL: String?
    private let status: UserStatus
    private let shouldShowStatus: Bool

    init(recipient: Recipient, shouldshowStatus: Bool = true) {
        self.init(imageURL: recipient.imageURL, status: recipient.status, shouldShowStatus: shouldshowStatus)
    }
    
    init(imageURL: String?, status: UserStatus, shouldShowStatus: Bool = true) {
        self.imageURL = imageURL
        self.status = status
        self.shouldShowStatus = shouldShowStatus
    }
    
    public var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            if let imageURL = imageURL {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .foregroundColor(Color.init(uiColor: UIColor.darkGray))
                    }
                    .foregroundColor(Color.init(uiColor: UIColor.darkGray))
                    .frame(width: size, height: size)
        
                    .mask(Circle())
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: size, height: size)
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
            }
            if shouldShowStatus {
                Circle()
                    .fill(status.statusColor)
                    .frame(width: size / 5, height: size / 5)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 2)
                    )
                    .offset(x: -size * 0.08, y: -size * 0.08)
            }
                
                
        }
    }
}



struct UserAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        UserAvatarView(recipient:         Recipient(name: "Jill Johnson", imageURL: "https://img.freepik.com/free-photo/young-man-writing-notebook_23-2148539806.jpg?semt=ais_items_boosted&w=740", status: .busy)
)
    }
}
