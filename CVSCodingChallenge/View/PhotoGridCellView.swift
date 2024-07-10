//
//  PhotoGridCellView.swift
//  CVSCodingChallenge
//
//  Created by Padraic Burns on 09/07/2024.
//

import SwiftUI

struct PhotoGridCellView: View {
    let photo: Photo
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: photo.media.m)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100,height: 100)
            } placeholder: {
                ProgressView().frame(width: 100,height: 100)
            }

            Text(photo.title)
        }
    }
}

#Preview {
    PhotoGridCellView(photo: Photo.getTestData())
}
