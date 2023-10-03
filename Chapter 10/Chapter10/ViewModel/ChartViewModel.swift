//
//  ChartViewModel.swift
//  Chapter10_SwiftUI
//
//  Created by James Thang on 25/06/2023.
//

import SwiftUI

class ChartViewModel: ObservableObject {
    
    var thisYearSpending: [MonthlySpending] = [
        .init(date: .createDate(1, 1, 2023), costs: 2500),
        .init(date: .createDate(1, 2, 2023), costs: 3500),
        .init(date: .createDate(1, 3, 2023), costs: 1500),
        .init(date: .createDate(1, 4, 2023), costs: 9500),
        .init(date: .createDate(1, 5, 2023), costs: 1950),
        .init(date: .createDate(1, 6, 2023), costs: 5100),
    ]

    var lastYearSpending: [MonthlySpending] = [
        .init(date: .createDate(1, 1, 2022), costs: 5800),
        .init(date: .createDate(1, 2, 2022), costs: 1500),
        .init(date: .createDate(1, 3, 2022), costs: 5500),
        .init(date: .createDate(1, 4, 2022), costs: 6500),
        .init(date: .createDate(1, 5, 2022), costs: 3950),
        .init(date: .createDate(1, 6, 2022), costs: 2100),
    ]
    
    init() { }
}




