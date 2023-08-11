//
//  NavigationView.swift
//  Lesson6
//
//  Created by James Thang on 03/04/2023.
//

import SwiftUI

struct NavigationViewExample: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    Text("First item View")
                } label: {
                    Text("First item")
                }
                NavigationLink {
                    Text("Second item View")
                } label: {
                    Text("Second item")
                }
                NavigationLink {
                    Text("Third item View")
                } label: {
                    Text("Third item")
                }
                NavigationLink {
                    Text("Fourth item View")
                } label: {
                    Text("Fourth item")
                }
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
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewExample()
    }
}








