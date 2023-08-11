//
//  ViewModifierExample.swift
//  Chapter2Project
//
//  Created by James Thang on 07/02/2023.
//

import SwiftUI

struct ViewModifierExample: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .border(Color.gray)
            .frame(width: 200, height: 30, alignment: .topLeading)
    }
}

struct ViewModifierExample_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierExample()
    }
}



