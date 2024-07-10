//
//  PhotoSearchData.swift
//  CVSCodingChallenge
//
//  Created by Padraic Burns on 09/07/2024.
//

import Foundation
// MARK: - PhotoSearchData
struct PhotoSearchData: Decodable {
    let title: String
    let link: String?
    let description: String?
    let modified: String?
    let generator: String?
    let items: [Photo]
}

// MARK: - Photo
struct Photo: Decodable {
    let title: String
    let link: String
    let media: Media
    let dateTaken: String
    let description, published: String
    let author, authorId, tags: String
}

struct Media: Decodable {
    let m: String
}

extension Photo: Identifiable {
    var id: String {
        return  dateTaken
    }
}

extension Photo {
   static func getTestData() -> Photo {
       return Photo(title: "porcupine - HD 1080p", link: "https://www.flickr.com/photos/jgates513/53839738580/", media: Media(m: "https://live.staticflickr.com/31337/53839738580_47af4d7c11_m.jpg"), dateTaken: "2024-07-06T18:13:04-08:00", description: "test description", published: "2024-07-06T18:13:04-08:00", author: "nobody@flickr.com (\"jgates513\")", authorId: "77419347@N00", tags: "porcupine")
    }
}
