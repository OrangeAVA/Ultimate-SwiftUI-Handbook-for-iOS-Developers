//
//  HomeView.swift
//  Chapter8_SwiftUIBook
//
//  Created by James Thang on 11/05/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = ViewModel()
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [SortDescriptor(\.likes)],
                  predicate: NSPredicate(format: "id != %@", "")) var imageDataLocal: FetchedResults<ImageCoreData>
    @State var isLoad = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    if viewModel.imageData.isEmpty {
                        ForEach(imageDataLocal, id: \.self) { data in
                            ItemLocalView(model: data)
                        }
                    } else {
                        ForEach(viewModel.imageData, id: \.self) { data in
                            ItemView(model: data)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Galerry").navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            if !isLoad {
                viewModel.fetchPost(context: context, oldLocalData: imageDataLocal)
                print(imageDataLocal.count)
                isLoad = true
            }
        }
    }
}

















