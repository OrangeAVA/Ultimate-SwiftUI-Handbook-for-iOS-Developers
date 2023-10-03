//
//  ContentView.swift
//  Chapter10
//
//  Created by James Thang on 06/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    // View Properties
    @State private var graphType: GraphType = .bar
    @StateObject private var viewModel = ChartViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Segment Picker
                Picker("", selection: $graphType) {
                    ForEach(GraphType.allCases, id: \.rawValue) { type in
                        Text(type.rawValue)
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .labelsHidden()
                
                switch graphType {
                case .bar:
                    BarChartView(viewModel: viewModel)
                case .line:
                    LineChartView(viewModel: viewModel)
                case .pie:
                    PieChartView(viewModel: viewModel)
                case .donut:
                    DonutChartView(viewModel: viewModel)
                }
                
                Spacer(minLength: 0)
            }
            .navigationTitle("Swift Charts")
            .padding(.top, 10)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

