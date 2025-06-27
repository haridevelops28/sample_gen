//
//  SampleTrends.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//
import Foundation

enum TimeRange: String, CaseIterable, Identifiable {
    case oneDay = "1D"
    case fiveDays = "5D"
    case oneMonth = "1M"
    case threeMonths = "3M"
    case sixMonths = "6M"
    case oneYear = "1Y"

    var id: String { self.rawValue }
}

struct ChartData: Identifiable, Codable {
    var id = UUID()
    let timestamp: Date
    let price: Double
}

