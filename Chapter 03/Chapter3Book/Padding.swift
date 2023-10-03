//
//  Padding.swift
//  Chapter3Book
//
//  Created by James Thang on 19/02/2023.
//

import SwiftUI

struct Padding: View {
    var body: some View {
        VStack {
            HStack {
                Text("Bottom Padding")
                    .font(.title)
                    .padding(.bottom, 50)
                    .background(.green)
                
                Text("Top Padding")
                    .font(.title)
                    .padding(.top, 50)
                    .background(.green)
            }
            HStack {
                Text("Leading Padding")
                    .font(.title)
                    .padding(.leading, 50)
                    .background(.green)
                
                Text("Trailing Padding")
                    .font(.title)
                    .padding(.trailing, 50)
                    .background(.green)
                    }
            HStack {
                Text("Vertical Padding")
                    .font(.title)
                    .padding(.vertical, 50)
                    .background(.green)
                
                Text("Horizontal Padding")
                    .font(.title)
                    .padding(.horizontal, 50)
                    .background(.green)
            }
        }
    }
}

struct Padding_Previews: PreviewProvider {
    static var previews: some View {
        Padding()
    }
}
