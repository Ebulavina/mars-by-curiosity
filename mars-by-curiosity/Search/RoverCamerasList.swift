//
//  RoverCamerasList.swift
//  mars-by-curiosity
//
//  Created by Ekaterina Bulavina on 03.09.2022.
//

import Foundation

enum RoverCamerasList: String, CaseIterable, Identifiable {
    case FHAZ, RHAZ, MAST, CHEMCAM, MAHLI, MARDI, NAVCAM, PANCAM, MINITES
    
    var id: String {
        self.rawValue
    }
    
    var title: String {
        switch self {
        case .FHAZ:
            return "Front Hazard Avoidance Camera"
        case .RHAZ:
            return "Rear Hazard Avoidance Camera"
        case .MAST:
            return "Mast Camera"
        case .CHEMCAM:
            return "Chemistry and Camera Complex"
        case .MAHLI:
            return "Mars Hand Lens Imager"
        case .MARDI:
            return "Mars Descent Imager"
        case .NAVCAM:
            return "Navigation Camera"
        case .PANCAM:
            return "Panoramic Camera"
        case .MINITES:
            return "Miniature Thermal Emission"
        }
    }
}
