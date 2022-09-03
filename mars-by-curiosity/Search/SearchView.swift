//
//  SearchView.swift
//  mars-by-curiosity
//
//  Created by Ekaterina Bulavina on 02.09.2022.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Select Camera and Date")
                        .padding(.top)
                    Spacer()
                }
                
                ForEach(viewModel.photos) { photo in
                    Text(photo.earthDate)
                }
                
                VStack(spacing: 16) {
                    VStack(alignment: .leading) {
                        Text("Rover Camera")
                            .font(.caption)
                        
                        HStack {
                            Picker("", selection: $viewModel.roverCamera) {
                                ForEach(RoverCamerasList.allCases) { item in
                                    Text(item.title).tag(item.rawValue)
                                }
                            }
                            .colorMultiply(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.down")
                        }
                        .padding(.horizontal, 16)
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .frame(height: 60)
                                .opacity(0.5)
                        )
                        .frame(height: 60)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Date")
                            .font(.caption)
                        
                        HStack {
                            DatePicker(
                                "",
                                selection: $viewModel.date,
                                displayedComponents: .date
                            )
                            .labelsHidden()
                            
                            Spacer()
                            
                            Image(systemName: "calendar")
                        }
                        .padding(.horizontal, 16)
                        .foregroundColor(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .frame(height: 60)
                                .opacity(0.5)
                        )
                        .frame(height: 60)
                    }
                    
                    Button(action: { viewModel.fetchPhotos() }) {
                        HStack {
                            Spacer()
                            
                            Text("Explore")
                            
                            Spacer()
                        }
                        .frame(height: 50)
                    }
                    .foregroundColor(.white)
                    .buttonStyle(.bordered)
                    .background(.red)
                    .cornerRadius(10)
                    .padding(.top, 24)
                }
                .padding(.horizontal, 24)
            }
            .navigationBarHidden(true)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
