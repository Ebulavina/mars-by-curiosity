//
//  marsByCuriosityApp.swift
//  mars-by-curiosity
//
//  Created by Ekaterina Bulavina on 01.09.2022.
//

import SwiftUI

@main
struct marsByCuriosityApp: App {
    var body: some Scene {
        WindowGroup {
            PhotosView()
        }
    }
}

let service = ApiService()

