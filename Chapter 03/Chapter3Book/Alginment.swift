//
//  Alginment.swift
//  Chapter3Book
//
//  Created by James Thang on 14/02/2023.
//

import SwiftUI

struct Alginment: View {
    var body: some View {
        VStack {
            HStack {
                Text("Top Leading")
                    .font(.title)
                    .frame(width: 120, height: 120, alignment: .topLeading)
                    .background(.green)
                
                Text("Top")
                    .font(.title)
                    .frame(width: 120, height: 120, alignment: .top)
                    .background(.green)
                
                Text("Top Trailing")
                    .font(.title)
                    .frame(width: 120, height: 120, alignment: .topTrailing)
                    .background(.green)
                    
            }
            HStack {
                Text("Leading")
                    .font(.title)
                    .frame(width: 120, height: 120, alignment: .leading)
                    .background(.green)
                
                Text("Center")
                    .font(.title)
                    .frame(width: 120, height: 120, alignment: .center)
                    .background(.green)
                
                Text("Trailing")
                    .font(.title)
                    .frame(width: 120, height: 120, alignment: .trailing)
                    .background(.green)
            }
            HStack {
                Text("Bottom Leading")
                    .font(.title)
                    .frame(width: 120, height: 120, alignment: .bottomLeading)
                    .background(.green)
                
                Text("Bottom")
                    .font(.title)
                    .frame(width: 120, height: 120, alignment: .bottom)
                    .background(.green)
                
                Text("Bottom Trailing")
                    .font(.title)
                    .frame(width: 120, height: 120, alignment: .bottomTrailing)
                    .background(.green)
            }
        }
    }
}

struct Alginment_Previews: PreviewProvider {
    static var previews: some View {
        Alginment()
    }
}
