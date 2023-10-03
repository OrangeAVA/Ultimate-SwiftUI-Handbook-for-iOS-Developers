//
//  TextView.swift
//  Chapter3Book
//
//  Created by James Thang on 11/02/2023.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                .background(.green)
            
            Color.orange
                .opacity(0.6)
                .frame(width: 100, height: 100)
        }
    }
}




struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
























