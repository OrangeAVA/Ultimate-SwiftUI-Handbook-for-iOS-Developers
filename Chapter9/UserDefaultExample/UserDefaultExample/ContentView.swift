//
//  ContentView.swift
//  UserDefaultExample
//
//  Created by James Thang on 31/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var number: Int = UserDefaults.standard.integer(forKey: "storedNumber")
    
    var body: some View {
        VStack {
            Text("Stored Number: \(number)")
                .font(.title)
            
            HStack {
                Button(action: {
                    number -= 1
                    storeNumber()
                }) {
                    Image(systemName: "minus.circle")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                .padding()
                
                Button(action: {
                    number += 1
                    storeNumber()
                }) {
                    Image(systemName: "plus.circle")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                }
                .padding()
            }
        }
        .padding()
    }
    
    func storeNumber() {
        UserDefaults.standard.set(number, forKey: "storedNumber")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


