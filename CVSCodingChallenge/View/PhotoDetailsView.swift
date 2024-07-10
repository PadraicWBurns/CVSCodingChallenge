//
//  PhotoDetailsView.swift
//  CVSCodingChallenge
//
//  Created by Padraic Burns on 09/07/2024.
//

import SwiftUI

struct PhotoDetailsView: View {
    @StateObject var photoDetailsViewModel: PhotoDetailsViewModel
    
    let width = UIScreen.main.bounds.size.width - 40
    
    init(photo: Photo) {
        self._photoDetailsViewModel = StateObject( wrappedValue: PhotoDetailsViewModel(photo: photo) )
    }

    var body: some View {
        VStack{
            AsyncImage(url: URL(string: photoDetailsViewModel.photo.media.m)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: UIScreen.main.bounds.size.height / 2)
            } placeholder: {
                ProgressView().frame(width: width, height: UIScreen.main.bounds.size.height / 2)
            }

            Text(photoDetailsViewModel.photo.title)
                .font(.largeTitle)
                .frame(width: width, alignment: .leading)
                .padding(.horizontal, 20)
            WebView(html: photoDetailsViewModel.photo.description)
                .frame(width: width, alignment: .leading)
                .padding(.horizontal, 20)
            Text(photoDetailsViewModel.photo.author)
                .frame(width: width, alignment: .leading)
                .padding(.horizontal, 20)
            Text(photoDetailsViewModel.published)
                .frame(width: width, alignment: .leading)
                .padding(.horizontal, 20)
        }
        .accessibilityElement()
            .accessibilityLabel(Text("\(photoDetailsViewModel.photo.title) was taken by \(photoDetailsViewModel.photo.author) and published on \(photoDetailsViewModel.published)"))
    }
}

#Preview {
    PhotoDetailsView(photo: Photo.getTestData())
}
