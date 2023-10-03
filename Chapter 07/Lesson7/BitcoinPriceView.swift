//
//  BitcoinPriceView.swift
//  Lesson7
//
//  Created by James Thang on 13/04/2023.
//

import SwiftUI

struct BitcoinPriceView: View {
    
    @State private var responseData = ""
    
    var body: some View {
        VStack {
            Text(responseData)
                .font(.title)
                .fontWeight(.medium)
                .padding()
            
            Button("Make Request") {
                // Async await
//                Task {
//                    do {
//                        let data = try await fetchDataAsync()
//                        self.responseData = "\(data.bpi.USD.rate) \(data.bpi.USD.code)"
//                    } catch {
//                        print(error.localizedDescription)
//                    }
//                }
                // Completion block
                fetchData { result in
                    switch result {
                    case .success(let data):
                        self.responseData = "\(data.bpi.USD.rate) \(data.bpi.USD.code)"
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func fetchDataAsync() async throws -> BitcoinData {
        guard let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json") else {
            throw NetworkError.invalidURL
        }
        
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed("Invalid response")
        }
        
        return try JSONDecoder().decode(BitcoinData.self, from: data)
    }
    
    func fetchData(completion: @escaping (Result<BitcoinData, Error>) -> Void) {
        guard let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let decodedResponse = try? JSONDecoder().decode(BitcoinData.self, from: data) {
                DispatchQueue.main.async {
                    completion(.success(decodedResponse))
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(.failure(NetworkError.requestFailed(error?.localizedDescription ?? "Unknown error")))
            }
        }
        .resume()
    }
    
    func fetchDataToJSON() {
        guard let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json") else {
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let jsonResponse = try? JSONSerialization.jsonObject(with: data) {
                    print(jsonResponse)
                }
            }
        }
        .resume()
    }
    
}

struct BitcoinPriceView_Previews: PreviewProvider {
    static var previews: some View {
        BitcoinPriceView()
    }
}




