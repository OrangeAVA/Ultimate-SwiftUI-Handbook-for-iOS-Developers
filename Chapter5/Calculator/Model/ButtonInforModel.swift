//
//  ButtonInforModel.swift
//  Calculator
//
//  Created by James Thang on 19/03/2023.
//

import SwiftUI

struct ButtonInforModel: Identifiable {
    var id: UUID = .init()
    var textNumber: String
    var textColor: Color
    var backgroundColor: Color
    var isOperation: Bool
    
    var number: Double {
        return Double(textNumber) ?? 0
    }
}



