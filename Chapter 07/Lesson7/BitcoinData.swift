//
//  BitcoinData.swift
//  Lesson7
//
//  Created by James Thang on 15/04/2023.
//

import Foundation

struct BitcoinData: Decodable {
    let bpi: BPI
}

struct BPI: Decodable {
    let USD: USDRate
}

struct USDRate: Decodable {
    let rate: String
    let code: String
}

enum NetworkError: Error {
    case invalidURL
    case requestFailed(String)
}
  


