//
//  StackAlignment.swift
//  Chapter3Book
//
//  Created by James Thang on 19/02/2023.
//

import SwiftUI

struct StackAlignment: View {
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 20) {
            Text("a")
                .font(.body)
            Text("b")
                .font(.callout)
            Text("c")
                .font(.title)
            Text("d")
                .font(.title3)
            Text("e")
                .font(.headline)
            Text("f")
                .font(.title2)
            Text("g")
                .font(.largeTitle)
        }
        .background {
            Color.yellow
        }
    }
}









struct StackAlignment_Previews: PreviewProvider {
    static var previews: some View {
        StackAlignment()
    }
}




