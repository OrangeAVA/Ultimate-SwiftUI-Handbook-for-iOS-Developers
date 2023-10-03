//
//  ItemLocalView.swift
//  Chapter8_SwiftUIBook
//
//  Created by James Thang on 04/06/2023.
//

import SwiftUI

struct ItemLocalView: View {
    
    let model: ImageCoreData
    @State var uiImage: UIImage?
    @State var isLoad = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(4/3, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
            Text(model.user?.name ?? "")
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
            if !isLoad {
                if let imageId = model.id {
                    uiImage = ImageManager.shared.loadImageFromDiskWith(fileName: imageId)
                }
                isLoad = true
            }
        }
    }
}


