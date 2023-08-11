//
//  NavigationStackExample.swift
//  Lesson6
//
//  Created by James Thang on 05/04/2023.
//

import SwiftUI

struct NavigationStackExample: View {

    private var stackView: [String] = ["First item", "Second item", "Third item", "Fourth item"]
    @State private var path: [String] = []

    var body: some View {
        NavigationStack(path: $path) {
            List(stackView, id: \.self) { view in
                NavigationLink(view, value: view)
            }
            .navigationBarTitle("My List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("Setting tapped!")
                    } label: {
                        Image(systemName: "gear")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            print("Plus tapped!")
                        } label: {
                            Image(systemName: "plus")
                        }
                        Button {
                            print("Trash tapped!")
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            .navigationDestination(for: String.self) { view in
                VStack(spacing: 24) {
                    Text("\(path.count), \(path.description)")
                    
                    Text(view)
                        .font(.title)
                    
                    if let lastPath = path.last, lastPath != "Fifth item" {
                        Button {
                            path.append("Fifth item")
                        } label: {
                            Text("Go to FifthView")
                                .font(.title)
                        }
                    }
                    
                    Button {
                        path.removeAll()
                    } label: {
                        Text("Back to Root")
                            .font(.title)
                    }
                }
            }
        }
    }
}




struct NavigationStackExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackExample()
    }
}
