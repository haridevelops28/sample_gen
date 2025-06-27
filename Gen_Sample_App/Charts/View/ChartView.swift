//
//  ChartView.swift
//  Gen_Sample_App
//
//  Created by Hariharan G on 6/27/25.
//
import SwiftUI
import Charts

struct ChartViewWithDraggabelSelection: View {
    let data: [ChartData]
    @State private var selectedElement: ChartData?
    @State private var dragLocation: CGPoint = .zero

    var body: some View {
        VStack {
            Chart {
                ForEach(data) { item in
                    LineMark(
                        x: .value("Time", item.timestamp),
                        y: .value("Price", item.price)
                    )
                    .interpolationMethod(.catmullRom)
                    .lineStyle(StrokeStyle(lineWidth: 3))
                    .foregroundStyle(.white)
                }

                if let selected = selectedElement {
                    PointMark(
                        x: .value("Time", selected.timestamp),
                        y: .value("Price", selected.price)
                    )
                    .foregroundStyle(.red)
                    .symbolSize(80)
                    .annotation(position: .top, alignment: .center) {
                        Text(selected.price.formatted(.currency(code: "EUR")))
                            .font(.caption2)
                            .padding(5)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading ,values: stride(from: 100, through: 300, by: 150).map { Double($0) }) { value in
                    AxisGridLine(centered: true).foregroundStyle(Color.white)
                    AxisValueLabel {
                        if let y = value.as(Double.self) {
                            Text("\(Int(y))")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .chartOverlay { proxy in
                GeometryReader { geo in
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    let location = value.location
                                    dragLocation = location

                                    if let date: Date = proxy.value(atX: location.x) {
                                        if let closest = data.min(by: {
                                            abs($0.timestamp.timeIntervalSince1970 - date.timeIntervalSince1970) <
                                            abs($1.timestamp.timeIntervalSince1970 - date.timeIntervalSince1970)
                                        }) {
                                            selectedElement = closest
                                        }
                                    }
                                }
                        )
                }
            }
            .frame(height: UIScreen.main.bounds.height / 5)
            .padding()
            .background(Color.black)
            .cornerRadius(16)
        }
    }
}
