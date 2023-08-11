//
//  CalculatorView.swift
//  Calculator
//
//  Created by James Thang on 01/03/2023.
//

import SwiftUI

struct CalculatorView: View {
    
    //    private let viewModel = CalculatorViewModel()
    //    View Model need to marked with @State Property Wrapper
    @StateObject private var viewModel = CalculatorViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            Text(viewModel.textResult)
                .foregroundColor(.white)
                .font(.system(size: 60))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
            
            ForEach(0..<viewModel.buttonData.count, id: \.self) { index in
                let hStackData = viewModel.buttonData[index]
                HStack(spacing: 20) {
                    ForEach(hStackData) { data in
                        Button {
                            if data.isOperation {
                                viewModel.operation = data.textNumber
                            } else {
                                if viewModel.operation == "AC" {
                                    if viewModel.firstNumber == 0 {
                                        viewModel.firstNumber = data.number
                                    } else {
                                        viewModel.firstNumber = viewModel.firstNumber * 10 + data.number
                                    }
                                } else {
                                    if viewModel.secondNumber == 0 {
                                        viewModel.secondNumber = data.number
                                    } else {
                                        viewModel.secondNumber = viewModel.secondNumber * 10 + data.number
                                    }
                                }
                            }
                        } label: {
                            if data.textNumber == "0" {
                                CalculatorButtonLayout(text: data.textNumber, textColor: data.textColor, backgroundColor: data.backgroundColor, width: 180)
                            } else {
                                CalculatorButtonLayout(text: data.textNumber, textColor: data.textColor, backgroundColor: data.backgroundColor)
                            }
                        }
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
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

