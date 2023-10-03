//
//  GeometryReader.swift
//  Chapter3Book
//
//  Created by James Thang on 14/02/2023.
//

import SwiftUI

struct GeometryReaderExample: View {
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            Rectangle()
                .fill(.red)
                .frame(width: size.width/3, height: size.width/3)
        }
    }
}


struct GeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderExample()
    }
}









