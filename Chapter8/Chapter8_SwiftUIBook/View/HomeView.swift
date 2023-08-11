//
//  HomeView.swift
//  Chapter8_SwiftUIBook
//
//  Created by James Thang on 11/05/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    ForEach(viewModel.imageData, id: \.self) { data in
                        ItemView(model: data)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Galerry").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}









