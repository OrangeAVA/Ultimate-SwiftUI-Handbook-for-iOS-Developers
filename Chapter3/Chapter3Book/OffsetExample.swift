//
//  OffsetExample.swift
//  Chapter3Book
//
//  Created by James Thang on 19/02/2023.
//

import SwiftUI

struct OffsetExample: View {
        
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .offset(x: 100, y: 100)
                .background(.green)
        }
        
    }
    
}

struct OffsetExample_Previews: PreviewProvider {
    static var previews: some View {
        OffsetExample()
    }
}













