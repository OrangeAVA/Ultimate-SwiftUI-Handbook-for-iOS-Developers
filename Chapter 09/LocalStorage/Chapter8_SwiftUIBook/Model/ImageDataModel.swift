//
//  FetchModel.swift
//  Zalo_Test_UiKit
//
//  Created by James Thang on 09/01/2022.
//

import Foundation


struct ImageDataModel: Codable, Hashable {
    let id: String
    let likes: Int
    let liked_by_user: Bool
    let user: UserData
    let urls: UrlsData
}

struct UserData: Codable, Hashable {
    let name: String
}

struct UrlsData: Codable, Hashable {
    let small: String
    let full: String
    let regular: String
    let thumb: String
}

struct LikePhotoModel: Codable {
    let photo: ImageDataModel
}

enum APIError: Error {
    case failedCreateURL
    case failedToGetData
    case failedToGetAccessToken
}




