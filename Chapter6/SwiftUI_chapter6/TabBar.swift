//
//  LinkedInTabBar.swift
//  Lesson6
//
//  Created by James Thang on 03/04/2023.
//

import SwiftUI

struct TabBar: View {
    
    @State private var defaultTabIndex = 1
    
    var body: some View {
        TabView(selection: $defaultTabIndex) {
            Text("First Tab")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
                .tag(0)
            Text("Second Tab")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
                .tag(1)
            Text("Third Tab")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Third")
                }
                .badge(3)
                .tag(2)
            Text("Fourth Tab")
                .tabItem {
                    Image(systemName: "4.circle")
                    Text("Fourth")
                }
                .tag(3)
        }
    }
}

struct LinkedInTabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
