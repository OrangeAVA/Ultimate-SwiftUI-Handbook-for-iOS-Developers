//
//  LineChartView.swift
//  Chapter10_SwiftUI
//
//  Created by James Thang on 25/06/2023.
//

import SwiftUI
import Charts

struct LineChartView: View {
    
    @ObservedObject var viewModel: ChartViewModel

    var body: some View {
        Chart {
            ForEach(viewModel.lastYearSpending + viewModel.thisYearSpending) { cost in
                LineMark(
                    x: .value("Month", cost.month),
                    y: .value("Costs", cost.costs)
                )
                .foregroundStyle(by: .value("Year", cost.year))
                
                PointMark(
                    x: .value("Month", cost.month),
                    y: .value("Costs", cost.costs)
                )
                .foregroundStyle(by: .value("Year", cost.year))
                .annotation(position: .overlay,
                            alignment: .bottom,
                            spacing: 10) {
                    Text("\(Int(cost.costs))")
                        .font(.caption)
                }
            }
        }   
        .frame(height: 300)
        .padding()
    }
}






#Preview {
    LineChartView(viewModel: ChartViewModel())
}
