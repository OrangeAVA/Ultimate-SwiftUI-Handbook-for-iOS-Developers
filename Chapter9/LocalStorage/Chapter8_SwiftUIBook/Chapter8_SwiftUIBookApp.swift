//
//  Chapter8_SwiftUIBookApp.swift
//  Chapter8_SwiftUIBook
//
//  Created by James Thang on 11/05/2023.
//

import SwiftUI

@main
struct Chapter8_SwiftUIBookApp: App {
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}




