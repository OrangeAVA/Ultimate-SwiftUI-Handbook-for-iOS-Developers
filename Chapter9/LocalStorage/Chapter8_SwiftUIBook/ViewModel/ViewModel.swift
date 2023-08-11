//
//  ViewModel.swift
//  Lesson8
//
//  Created by James Thang on 24/04/2023.
//

import SwiftUI
import CoreData

class ViewModel: ObservableObject {
    
    @Published private(set) var imageData = [ImageDataModel]()
    
    init() {}
    
    func fetchPost(context: NSManagedObjectContext, oldLocalData: FetchedResults<ImageCoreData>) {
        APIsManager.shared.fetch20Images { [weak self] result in
            guard let this = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    this.imageData.append(contentsOf: data)
                    this.deleteAll(data: oldLocalData, context: context) { _ in
                        this.saveDataToLocal(data: data, context: context)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
     }
    
    private func saveDataToLocal(data: [ImageDataModel], context: NSManagedObjectContext) {
        data.forEach { imageData in
            let newLocalData = ImageCoreData(context: context)
            newLocalData.id = imageData.id
            newLocalData.liked_by_user = imageData.liked_by_user
            newLocalData.likes = Int16(imageData.likes)
            
            let userData = UserCoreData(context: context)
            userData.name = imageData.user.name
            newLocalData.user = userData
            
            let urlData = UrlsCoreData(context: context)
            urlData.small = imageData.urls.small
            urlData.full = imageData.urls.thumb
            urlData.regular = imageData.urls.regular
            urlData.thumb = imageData.urls.thumb
            newLocalData.url = urlData
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func deleteAll(data: FetchedResults<ImageCoreData>, context: NSManagedObjectContext, completion: @escaping (Bool) -> ()) {
        for item in data {
            context.delete(item)
        }
        do {
            try context.save()
            completion(true)
        } catch {
            completion(false)
        }
    }
}




