//
//  TrendsView.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//

import SwiftUI
import Combine
import Charts

@Observable
class ChartsSegmentViewModel {
    private(set) var data: [ChartData]! = []
    var selectedTimeRange: TimeRange {
        didSet {
            print("Selected time range: \(selectedTimeRange)")
            data = trendsManager.generateSampleSpendsData(for: selectedTimeRange)
        }
    }
    
    private let trendsManager = TrendsManager()
    
    init() {
        selectedTimeRange = TimeRange.fiveDays
        data = trendsManager.generateSampleSpendsData(for: selectedTimeRange)
    }
}

struct DemoTrendsView: View {
    
    @State private var viewModel: ChartsSegmentViewModel
    
    init(viewModel: ChartsSegmentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Rectangle()
                .fill(Color.black)
                .frame(height: UIScreen.main.bounds.height / 5 + 40)
                .cornerRadius(16)
                
            VStack(alignment: .leading, spacing: 0) {
                ChartViewWithDraggabelSelection(data: viewModel.data).padding(.top, 16)
                TimeRangeSegmentedControl(selectedRange: $viewModel.selectedTimeRange)
            }.padding(.bottom)
        }
    }
}

struct DemoTrendsView_Previews: PreviewProvider {
    static var previews: some View {
        DemoTrendsView(viewModel: ChartsSegmentViewModel())
    }
}

