//
//  PieChartView.swift
//  Chapter10_SwiftUI
//
//  Created by James Thang on 25/06/2023.
//

import SwiftUI
import Charts

struct PieChartView: View {
    
    @ObservedObject var viewModel: ChartViewModel

    
    var body: some View {
        Chart {
            ForEach(viewModel.thisYearSpending.sorted(by: {  $0.costs > $1.costs })) { cost in
                SectorMark(
                    angle: .value("Costs", cost.costs),
                    angularInset: 1)
                .cornerRadius(8)
                .foregroundStyle(by: .value("Month", cost.month))
            }
        }
        .frame(height: 300)
        .padding()
        .chartLegend(position: .bottom, alignment: .center, spacing: 25)
    }
}

#Preview {
    PieChartView(viewModel: ChartViewModel())
}
