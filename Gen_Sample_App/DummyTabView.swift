//
//  DummyTabView.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//

import SwiftUI

struct DummyTabView: View {
    private let tabName: String
    
    init(tabName: String) {
        self.tabName = tabName
    }
    var body: some View {
        ZStack {
            Color(red: 224/255, green: 222/255, blue: 208/255)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Dummy Tab View: Tab: \(tabName)")
                Spacer()
            }
        }
        
    }
}
