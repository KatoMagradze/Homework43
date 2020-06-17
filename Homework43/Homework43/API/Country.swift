//
//  Country.swift
//  Homework43
//
//  Created by Kato on 6/17/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct Country: Codable {
    let name: String
    let capital: String
    let borders: [String]
    let currencies: [Currency]
    
    // additional
    let region: String
    let population: Int
    let nativeName: String
    let flag: String
 
    
}

struct Currency: Codable {
    let code: String?
    let name: String?
    let symbol: String?
}
