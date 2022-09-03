//
//  ApiService.swift
//  mars-by-curiosity
//
//  Created by Ekaterina Bulavina on 01.09.2022.
//

import Foundation
import Combine

protocol ApiServiceProtocol {
    func getPhotos(earthDate: String, camera: String) -> AnyPublisher<Photos, Error>
}

class ApiService: ApiServiceProtocol {
    let baseUrl = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=DEMO_KEY&"
    
    func getPhotos(earthDate: String, camera: String) -> AnyPublisher<Photos, Error> {
        let url = URL(string: baseUrl + "earth_date=" + earthDate + "&camera=" + camera)!
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: Photos.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
