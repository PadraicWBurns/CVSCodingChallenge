//
//  HomeView.swift
//  CVSCodingChallenge
//
//  Created by Padraic Burns on 7/9/24.
//

import SwiftUI

              
struct HomeView: View {
    @StateObject var photoSearchViewModel: PhotoSearchViewModel = PhotoSearchViewModel()
    @State var searchText:String = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                switch photoSearchViewModel.homeViewState {
                case .load(let photos):
                    showPhotosGrid(photos: photos)
                        .searchable(text: $searchText,placement: .automatic, prompt: "Search Photos")
                        .onChange(of: searchText, initial: true) { searchText, newValue in
                            photoSearchViewModel.search(newValue)
                        }
                case .error:
                    Text("Error in loading page, pls try again")
                }
            }
            .navigationTitle("Photos")
        }
    }
    
    @ViewBuilder
    func showPhotosGrid(photos: [Photo]) -> some View {
        SearchGridView(photos: photos)
    }
}

#Preview {
    HomeView(photoSearchViewModel: PhotoSearchViewModel(repository: PhotoRepository(apiService: APIServiceManager())))
}
