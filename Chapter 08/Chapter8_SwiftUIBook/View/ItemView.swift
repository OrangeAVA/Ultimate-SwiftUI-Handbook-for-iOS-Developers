//
//  ItemView.swift
//  Chapter8_SwiftUIBook
//
//  Created by James Thang on 11/05/2023.
//


import SwiftUI

struct ItemView: View {
    
    let model: ImageDataModel
    @State var uiImage: UIImage?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(4/3, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
            Text(model.user.name)
                .foregroundColor(.primary)
                .fontWeight(.medium)
            
            HStack {
                Button(model.liked_by_user ? "Unlike" : "Like") {
                    
                }
                
                Spacer()
                
                Text("\(model.likes) likes")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }
        .onAppear {
            APIsManager.shared.downloadImage(from: model.urls.regular) { result in
                switch result {
                case .success(let data):
                    uiImage = UIImage(data: data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}


























