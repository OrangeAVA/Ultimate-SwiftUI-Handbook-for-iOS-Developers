//
//  ContentView.swift
//  Chapter2Project
//
//  Created by James Thang on 28/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardComponentFunction(symbolName: "house", title: "Home for Rent", subTitle: "#0xxx123456")
            CardComponentFunction(symbolName: "car", title: "Cars for Rent", subTitle: "#0xxx123456")
            CardComponentFunction(symbolName: "bicycle", title: "Bike for Rent", subTitle: "#0xxx123456")
        }
    }
    
    @ViewBuilder
    func CardComponentFunction(symbolName: String, title: String, subTitle: String) -> some View {
        HStack {
            ZStack {
                Circle()
                    .fill(.blue.opacity(0.75))
                    .frame(width: 50, height: 50)
                Image(systemName: symbolName)
                    .foregroundColor(.white)
            }
            VStack {
                Text(title)
                    .font(.title)
                
                Text(subTitle)
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
        }
        .padding()
        .frame(width: 300)
        .background {
            RoundedRectangle(cornerRadius: 5)
                .stroke()
        }
    }
}

struct CardComponent: View {
    var symbolName: String
    var title: String
    var subTitle: String
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(.blue.opacity(0.75))
                    .frame(width: 50, height: 50)
                Image(systemName: symbolName)
                    .foregroundColor(.white)
            }
            
            VStack {
                Text(title)
                    .font(.title)
                
                Text(subTitle)
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
        }
        .padding()
        .frame(width: 300)
        .background {
            RoundedRectangle(cornerRadius: 5)
                .stroke()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
