//
//  TrendsManager.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//
import Foundation

class TrendsManager {
    private(set) var sampleData: [String: [ChartData]] = [:]
    
    func generateSampleSpendsData(for range: TimeRange) -> [ChartData] {
        if let dataToSend = sampleData[range.rawValue], !dataToSend.isEmpty {
            return dataToSend
        }
        var data: [ChartData] = []
        let now = Date()
        var interval: TimeInterval = 0
        var points: Int = 0

        switch range {
        case .oneDay:
            interval = 30 * 10 // every 10 minutes
            points = 6 * 48     // 6 per hour * 24 hours
        case .fiveDays:
            interval = 120 * 60 // 2 hourly
            points = 6 * 48
        case .oneMonth:
            interval = 60 * 60 * 3 // every 3 hours
            points = 30 * 12
        case .threeMonths:
            interval = 60 * 60 * 6 // every 6 hours
            points = 90 * 4
        case .sixMonths:
            interval = 60 * 60 * 12
            points = 180 * 2
        case .oneYear:
            interval = 60 * 60 * 24 // daily
            points = 365
        }

        for i in 0..<points {
            let date = now.addingTimeInterval(-Double(points - i) * interval)
            let price = Double(Int.random(in: 100..<350)) + sin(Double(i) * 0.2) * 80 + Double.random(in: -40...40)
            data.append(ChartData(timestamp: date, price: max(0, price)))
        }
        sampleData[range.rawValue] = data
        return data
    }

}
