//
//  CalculatorView.swift
//  Calculator
//
//  Created by James Thang on 01/03/2023.
//

import SwiftUI

struct CalculatorView: View {
    
    @State var operation: String = "AC" {
        willSet {
            performOperationWillSet(newValue: newValue, oldValue: self.operation)
        }
        didSet {
            performOperationDidSet(operation: oldValue)
        }
    }

    
    @State var firstNumber: Double = 0 {
        willSet {
            textResult = "\(newValue)"
        }
    }
    
    
    @State var secondNumber: Double = 0 {
        willSet {
            textResult = "\(newValue)"
        }
    }
    
    @State var textResult: String = "0"
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            Text(textResult)
                .foregroundColor(.white)
                .font(.system(size: 60))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
            
            HStack(spacing: 20) {
                Button {
                    operation = "AC"
                } label: {
                    CalculatorButtonLayout(text: "AC", textColor: .black, backgroundColor: .gray.opacity(0.85))
                }

                Button {
                    operation = "+/-"
                } label: {
                    CalculatorButtonLayout(text: "+/-", textColor: .black, backgroundColor: .gray.opacity(0.85))
                }

                Button {
                    operation = "%"
                } label: {
                    CalculatorButtonLayout(text: "%", textColor: .black, backgroundColor: .gray.opacity(0.85))
                }

                Button {
                    operation = "÷"
                } label: {
                    CalculatorButtonLayout(text: "÷", textColor: .white, backgroundColor: .orange)
                }
            }
            
            HStack(spacing: 20) {
                
                Button {
                    if operation == "AC" {
                        if firstNumber == 0 {
                            firstNumber = 7
                        } else {
                            firstNumber = firstNumber * 10 + 7
                        }
                    } else {
                        if secondNumber == 0 {
                            secondNumber = 7
                        } else {
                            secondNumber = secondNumber * 10 + 7
                        }
                    }
                } label: {
                    CalculatorButtonLayout(text: "7", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75))
                }

                Button {
                    if operation == "AC" {
                        if firstNumber == 0 {
                            firstNumber = 8
                        } else {
                            firstNumber = firstNumber * 10 + 8
                        }
                    } else {
                        if secondNumber == 0 {
                            secondNumber = 8
                        } else {
                            secondNumber = secondNumber * 10 + 8
                        }
                    }
                } label: {
                    CalculatorButtonLayout(text: "8", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75))
                }

                Button {
                    if operation == "AC" {
                        if firstNumber == 0 {
                            firstNumber = 9
                        } else {
                            firstNumber = firstNumber * 10 + 9
                        }
                    } else {
                        if secondNumber == 0 {
                            secondNumber = 9
                        } else {
                            secondNumber = secondNumber * 10 + 9
                        }
                    }
                } label: {
                    CalculatorButtonLayout(text: "9", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75))
                }

                Button {
                    operation = "x"
                } label: {
                    CalculatorButtonLayout(text: "×", textColor: .white, backgroundColor: .orange)
                }
            }
            
            HStack(spacing: 20) {
                Button {
                    if operation == "AC" {
                        if firstNumber == 0 {
                            firstNumber = 4
                        } else {
                            firstNumber = firstNumber * 10 + 4
                        }
                    } else {
                        if secondNumber == 0 {
                            secondNumber = 4
                        } else {
                            secondNumber = secondNumber * 10 + 4
                        }
                    }
                } label: {
                    CalculatorButtonLayout(text: "4", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75))
                }

                Button {
                    if operation == "AC" {
                        if firstNumber == 0 {
                            firstNumber = 5
                        } else {
                            firstNumber = firstNumber * 10 + 5
                        }
                    } else {
                        if secondNumber == 0 {
                            secondNumber = 5
                        } else {
                            secondNumber = secondNumber * 10 + 5
                        }
                    }
                } label: {
                    CalculatorButtonLayout(text: "5", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75))
                }

                Button {
                    if operation == "AC" {
                        if firstNumber == 0 {
                            firstNumber = 6
                        } else {
                            firstNumber = firstNumber * 10 + 6
                        }
                    } else {
                        if secondNumber == 0 {
                            secondNumber = 6
                        } else {
                            secondNumber = secondNumber * 10 + 6
                        }
                    }
                } label: {
                    CalculatorButtonLayout(text: "6", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75))
                }

                Button {
                    operation = "-"
                } label: {
                    CalculatorButtonLayout(text: "-", textColor: .white, backgroundColor: .orange)
                }
            }
            
            HStack(spacing: 20) {
                Button {
                    if operation == "AC" {
                        if firstNumber == 0 {
                            firstNumber = 1
                        } else {
                            firstNumber = firstNumber * 10 + 1
                        }
                    } else {
                        if secondNumber == 0 {
                            secondNumber = 1
                        } else {
                            secondNumber = secondNumber * 10 + 1
                        }
                    }
                } label: {
                    CalculatorButtonLayout(text: "1", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75))
                }

                Button {
                    if operation == "AC" {
                        if firstNumber == 0 {
                            firstNumber = 2
                        } else {
                            firstNumber = firstNumber * 10 + 2
                        }
                    } else {
                        if secondNumber == 0 {
                            secondNumber = 2
                        } else {
                            secondNumber = secondNumber * 10 + 2
                        }
                    }
                } label: {
                    CalculatorButtonLayout(text: "2", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75))
                }

                Button {
                    if operation == "AC" {
                        if firstNumber == 0 {
                            firstNumber = 3
                        } else {
                            firstNumber = firstNumber * 10 + 3
                        }
                    } else {
                        if secondNumber == 0 {
                            secondNumber = 3
                        } else {
                            secondNumber = secondNumber * 10 + 3
                        }
                    }
                } label: {
                    CalculatorButtonLayout(text: "3", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75))
                }

                Button {
                    operation = "+"
                } label: {
                    CalculatorButtonLayout(text: "+", textColor: .white, backgroundColor: .orange)
                }
            }
            
            HStack(spacing: 20) {
                Button {
                    if operation == "AC" {
                        if firstNumber == 0 {
                            firstNumber = 0
                        } else {
                            firstNumber = firstNumber * 10 + 0
                        }
                    } else {
                        if secondNumber == 0 {
                            secondNumber = 1
                        } else {
                            secondNumber = secondNumber * 10
                        }
                    }
                } label: {
                    CalculatorButtonLayout(text: "0", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75), width: 180)
                }

                Button {
                    
                } label: {
                    CalculatorButtonLayout(text: ",", textColor: .white, backgroundColor: Color(uiColor: .darkGray).opacity(0.75))
                }

                Button {
                    operation = "="
                } label: {
                    CalculatorButtonLayout(text: "=", textColor: .white, backgroundColor: .orange)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func performOperationDidSet(operation: String) {
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
    
    func performOperationWillSet(newValue: String, oldValue: String) {
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




struct CalculatorButtonLayout: View {
    let text: String
    let textColor: Color
    let backgroundColor: Color
    var width: CGFloat = 80
    var height: CGFloat = 80
    
    var body: some View {
        ZStack {
            if width == height {
                Circle()
                    .foregroundColor(backgroundColor)
            } else {
                Capsule()
                    .foregroundColor(backgroundColor)
            }
            
            Text(text)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(textColor)
                .frame(alignment: .center)
            
        }
        .frame(width: width, height: height, alignment: .center)
    }
}


struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}


