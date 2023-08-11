//
//  StackView.swift
//  Chapter2Project
//
//  Created by James Thang on 01/02/2023.
//

import SwiftUI

struct StackView: View {
    let colors: [Color] = [.red, .blue, .green]
    var body: some View {
        ZStack() {
            ForEach(0..<3) { item in
                RoundedRectangle(cornerRadius: 5)
                    .fill(colors[item])
                    .frame(width: CGFloat((item + 1)) * 100, height: CGFloat((item + 1)) * 100)
                    .zIndex(Double(item) * -1)
            }
        }
        .frame(width: 300, height: 200)
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
