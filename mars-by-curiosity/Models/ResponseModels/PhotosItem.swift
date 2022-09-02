//
//  PhotosItem.swift
//  mars-by-curiosity
//
//  Created by Ekaterina Bulavina on 01.09.2022.
//

import Foundation

struct PhotosItem: Decodable, Identifiable {
    let id: Int
    let earthDate: String
    let imgSrc: String
    let camera: Camera
    
    enum CodingKeys: String, CodingKey {
        case id
        case earthDate = "earth_date"
        case imgSrc = "img_src"
        case camera
    }
}
