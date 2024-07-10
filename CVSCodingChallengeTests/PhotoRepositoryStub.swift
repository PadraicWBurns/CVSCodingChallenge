//
//  PhotoRepositoryStub.swift
//  CVSCodingChallenge
//
//  Created by Padraic Burns on 7/9/24.
//

import Foundation
@testable import CVSCodingChallenge

class PhotoRepositoryStub: PhotoRepositoryProtocol  {
    func getPhotosData(withSearchTerm: String) async throws -> PhotoSearchData {
        return PhotoSearchData.photos
    }
}

extension PhotoSearchData {
    static var photos: PhotoSearchData {
        return PhotoSearchData(title: "TestTitle", link: "TestLink", description: "TestDescription", modified: nil, generator: nil, items: [Photo.getTestData()])
    }
}
