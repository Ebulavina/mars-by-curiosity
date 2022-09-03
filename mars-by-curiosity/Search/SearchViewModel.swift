//
//  SearchViewModel.swift
//  mars-by-curiosity
//
//  Created by Ekaterina Bulavina on 02.09.2022.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    @Published var date = Date()
    @Published var roverCamera = RoverCamerasList.FHAZ
    @Published var photos: [PhotoCard] = []
    
    private var disposables = Set<AnyCancellable>()
    
    static func dateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: date)
    }

    func fetchPhotos() {
        service.getPhotos(earthDate: SearchViewModel.dateToString(date), camera: roverCamera.rawValue)
            .sink { [weak self] complection in
                switch complection {
                case .failure(let error):
                    self?.photos = []
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] resources in
                self?.photos = resources.photos.map({ photosItem in
                    PhotoCard(photo: photosItem)
                })
            }
            .store(in: &disposables)
    }
}
