//
//  TimeRangeSegmentedControl.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//

import SwiftUI


struct TimeRangeSegmentedControl: View {
    @Binding var selectedRange: TimeRange

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(TimeRange.allCases) { range in
                    Button(action: {
                        selectedRange = range
                    }) {
                        Text(range.rawValue)
                            .font(.system(size: 14, weight: .bold))
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(selectedRange == range ? Color.gray : .clear)
                            .foregroundColor(.white)
                            .mask(RoundedRectangle(cornerRadius: 8))
                            
                    }
                    .animation(.easeInOut(duration: 0.2), value: selectedRange)
                }
            }.padding(.horizontal, 8)
        }
    }
}
