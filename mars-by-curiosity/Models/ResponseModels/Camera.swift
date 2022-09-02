//
//  Camera.swift
//  mars-by-curiosity
//
//  Created by Ekaterina Bulavina on 01.09.2022.
//

import Foundation

struct Camera: Decodable {
    let id: Int
    let name: String
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
    }
}
