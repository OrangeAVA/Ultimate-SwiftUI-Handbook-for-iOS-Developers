//
//  ViewModel.swift
//  Lesson8
//
//  Created by James Thang on 24/04/2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    @Published private(set) var imageData = [ImageDataModel]()
    
    init() {
        fetchPost()
    }
    
    private func fetchPost() {
        APIsManager.shared.fetch20Images { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.imageData.append(contentsOf: data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
     }
}




