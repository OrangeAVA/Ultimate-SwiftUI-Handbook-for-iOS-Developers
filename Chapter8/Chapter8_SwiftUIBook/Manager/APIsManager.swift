//
//  APIsManager.swift
//  Chapter8_SwiftUIBook
//
//  Created by James Thang on 12/05/2023.
//

import Foundation

class APIsManager {
    
    static let shared = APIsManager()
        
    private init() {
        // Initialization code
    }
        
    struct Constant {
        // Direct User
        static let authBaseURL = "https://unsplash.com/oauth/authorize"
        static let response_type = "code"
        static let scope = "public+write_likes"
        
        // Token Exchange
        static let baseURL = "https://unsplash.com/oauth/token"
        static let acccessKey = "RJDxAT3-mJbmpoiGGef2PWR7lctXy-sTwB4zB-2U3E0"
        static let secretKey = "I7zx8BaHsGdfL9llnjDqfcYHB1ygZYr-H1eNAb9c3xE"
        static let redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
        static let grant_type = "authorization_code"
        
        // Photo API
        static let basePhotoAPIURL = "https://api.unsplash.com/photos"
        static let per_page = "20"
    }
    
    func fetch20Images(completion: @escaping (Result<[ImageDataModel], Error>) -> Void) {
        let urlString = Constant.basePhotoAPIURL + "?&page=1" + "&per_page=\(Constant.per_page)"
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.failedCreateURL))
            return
        }
        var request = URLRequest(url: url)
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([ImageDataModel].self, from: data)
                completion(.success(result))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func returnAuthorizationURL() -> String {
        return Constant.authBaseURL + "?client_id=" + Constant.acccessKey + "&redirect_uri=" + Constant.redirect_uri + "&response_type=" + Constant.response_type + "&scope=" + Constant.scope
    }
    
    var accessToken = ""
    
    func exchangeToken(code: String, completion: @escaping (Bool) -> Void) {
        // Get Token
        guard let url = URL(string: Constant.baseURL) else {
            return
        }
        
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "client_id", value: Constant.acccessKey),
            URLQueryItem(name: "client_secret", value: Constant.secretKey),
            URLQueryItem(name: "redirect_uri", value: Constant.redirect_uri),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "grant_type", value: "authorization_code"),
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = components.query?.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(false)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(AuthResponse.self, from: data)
                self?.accessToken = result.access_token
                completion(true)
            } catch {
                print(error.localizedDescription)
                completion(false)
            }
            
        }
        task.resume()
    }
    
    func downloadImage(from urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            let error = APIError.failedCreateURL
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                completion(.success(data))
            } else {
                let error = APIError.failedToGetData
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
        
}








