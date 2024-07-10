//
//  PhotoDetailsViewModel.swift
//  CVSCodingChallenge
//
//  Created by Padraic Burns on 7/9/24.
//

import Foundation

final class PhotoDetailsViewModel: ObservableObject {
    
    let photo: Photo
    
    var published: String {
        let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatter.date(from: photo.published) {
            dateFormatter.dateStyle = .long
            return dateFormatter.string(from: date)
        }
        else {
            return ""
        }
    }
    
    init(photo: Photo) {
        self.photo = photo
    }
}
