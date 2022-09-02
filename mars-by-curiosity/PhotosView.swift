//
//  PhotosView.swift
//  mars-by-curiosity
//
//  Created by Ekaterina Bulavina on 01.09.2022.
//

import SwiftUI

struct PhotosView: View {
    @ObservedObject var viewModel = PhotosViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.photos) { photo in
                Text(photo.earthDate)
            }
        }
        .onAppear {
            viewModel.fetchPhotos()
        }
    }
}
//
//struct PhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosView()
//    }
//}
