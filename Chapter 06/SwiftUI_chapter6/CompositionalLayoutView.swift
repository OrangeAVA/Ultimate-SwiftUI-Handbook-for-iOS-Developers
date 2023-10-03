//
//  CompositionalLayoutView.swift
//  Lesson6
//
//  Created by James Thang on 08/04/2023.
//

import SwiftUI

struct CompositionalLayoutView: View {
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2),
    ]

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 2) {
                    ForEach(0...40, id: \.self) { index in
                        Image("LandscapeImage")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                    }
                }
            }
            .navigationBarTitle(Text("Instagram"), displayMode: .inline)
        }
    }

}

struct CompositionalLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        CompositionalLayoutView()
    }
}














