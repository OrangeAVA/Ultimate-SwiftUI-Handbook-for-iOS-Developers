//





//  BarChartView.swift
//  Chapter10_SwiftUI
//
//  Created by James Thang on 25/06/2023.
//

import SwiftUI
import Charts

struct BarChartView: View {
    
    @ObservedObject var viewModel: ChartViewModel
    
    var body: some View {
        Chart {
            ForEach(viewModel.thisYearSpending) { cost in
                BarMark(
                    x: .value("Month", cost.month),
                    y: .value("Costs", cost.costs)
                )
                .cornerRadius(8)
                .foregroundStyle(by: .value("Month", cost.month))
            }
        }
        .frame(height: 300)
        .padding()
    }
}











#Preview {
    BarChartView(viewModel: ChartViewModel())
}








//.cornerRadius(5)
//.foregroundStyle(by: .value("Month", cost.month))
