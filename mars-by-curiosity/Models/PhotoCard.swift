//
//  PhotoCard.swift
//  mars-by-curiosity
//
//  Created by Ekaterina Bulavina on 01.09.2022.
//

import Foundation

struct PhotoCard: Identifiable {
    let id: Int
    let earthDate: String
    let imgSrc: String
    let camera: Camera
    
    init(photo: PhotosItem) {
        self.id = photo.id
        self.earthDate = photo.earthDate
        self.imgSrc = photo.imgSrc
        self.camera = photo.camera
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case earthDate = "earth_date"
        case imgSrc = "img_src"
        case camera
    }
}
