//
//  SearchGridView.swift
//  CVSCodingChallenge
//
//  Created by Padraic Burns on 09/07/2024.
//

import SwiftUI

struct SearchGridView: View {
    var photos: [Photo]
    let colums: [GridItem] = [GridItem(.flexible(minimum: 100, maximum: 150)), GridItem(.flexible(minimum: 100, maximum: 150))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums,spacing: 10) {
                ForEach(photos) { photo in
                    NavigationLink {
                        PhotoDetailsView(photo: photo)
                    } label: {
                        PhotoGridCellView(photo: photo)
                    }

                }
            }
        }
    }
}

#Preview {
    SearchGridView(photos: [])
}
