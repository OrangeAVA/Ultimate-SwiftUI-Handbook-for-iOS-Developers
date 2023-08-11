//
//  ContentView.swift
//  Chapter3Book
//
//  Created by James Thang on 11/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    
    var body: some View {
        Text("Hello World")
            .background {
                GeometryReader { geometry in
                    let size = geometry.size
                    Color.green
                        .onAppear {
                            width = size.width
                            height = size.height
                        }
                }
            }
            .position(x: 100 + width/2, y: 100 + height/2)
    }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}












