//
//  PhotosViewModel.swift
//  mars-by-curiosity
//
//  Created by Ekaterina Bulavina on 01.09.2022.
//

import Foundation
import Combine

final class PhotosViewModel: ObservableObject {
    @Published var photos: [PhotoCard] = []
    
    private var disposables = Set<AnyCancellable>()
    
    func fetchPhotos() {
        service.getPhotos()
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
