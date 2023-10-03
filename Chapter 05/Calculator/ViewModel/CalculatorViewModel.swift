//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by James Thang on 24/03/2023.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    
    private(set) var buttonData: [[ButtonInforModel]] = [
        [
            ButtonInforModel(textNumber: "AC", textColor: .black, backgroundColor: .gray.opacity(0.85), isOperation: true),
            ButtonInforModel(textNumber: "+/-", textColor: .black, backgroundColor: .gray.opacity(0.85), isOperation: true),
            ButtonInforModel(textNumber: "%", textColor: .black, backgroundColor: .gray.opacity(0.85), isOperation: true),
            ButtonInforModel(textNumber: "÷", textColor: .white, backgroundColor: .orange, isOperation: true)
        ],
        [
            ButtonInforModel(textNumber: "7", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), isOperation: false),
            ButtonInforModel(textNumber: "8", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), isOperation: false),
            ButtonInforModel(textNumber: "9", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), isOperation: false),
            ButtonInforModel(textNumber: "x", textColor: .white, backgroundColor: .orange, isOperation: true),
        ],
        [
            ButtonInforModel(textNumber: "4", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), isOperation: false),
            ButtonInforModel(textNumber: "5", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), isOperation: false),
            ButtonInforModel(textNumber: "6", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), isOperation: false),
            ButtonInforModel(textNumber: "-", textColor: .white, backgroundColor: .orange, isOperation: true),
        ],
        [
            ButtonInforModel(textNumber: "1", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), isOperation: false),
            ButtonInforModel(textNumber: "2", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), isOperation: false),
            ButtonInforModel(textNumber: "3", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), isOperation: false),
            ButtonInforModel(textNumber: "+", textColor: .white, backgroundColor: .orange, isOperation: true),
        ],
        [
            ButtonInforModel(textNumber: "0", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), isOperation: false),
            ButtonInforModel(textNumber: ",", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), isOperation: false),
            ButtonInforModel(textNumber: "=", textColor: .white, backgroundColor: .orange, isOperation: true),
        ]
    ]
    
    //@State get replaced with @Published
    @Published var operation: String = "AC" {
        willSet {
            performOperationWillSet(newValue: newValue, oldValue: self.operation)
        }
        didSet {
            performOperationDidSet(operation: oldValue)
        }
    }
    
    @Published var firstNumber: Double = 0 {
        willSet {
            textResult = "\(newValue)"
        }
    }
    
    @Published var secondNumber: Double = 0 {
        willSet {
            textResult = "\(newValue)"
        }
    }
    
    @Published var textResult: String = "0"
    
    init() {}
    
    private func performOperationDidSet(operation: String) {
        if operation == "+" {
            let result = firstNumber + secondNumber
            secondNumber = 0
            firstNumber = result
        } else if operation == "-" {
            let result = firstNumber - secondNumber
            secondNumber = 0
            firstNumber = result
        } else if operation == "x" {
            let result = firstNumber * secondNumber
            secondNumber = 0
            firstNumber = result
        } else if operation == "÷" {
            let result = firstNumber / secondNumber
            secondNumber = 0
            firstNumber = result
        }
    }
    
    private func performOperationWillSet(newValue: String, oldValue: String) {
        if newValue == "+/-" {
            performOperationDidSet(operation: oldValue)
            firstNumber = -firstNumber
        } else if newValue == "%" {
            performOperationDidSet(operation: oldValue)
            firstNumber = firstNumber/100
        } else if newValue == "AC" {
            firstNumber = 0
            secondNumber = 0
        }
    }
    
}


