//
//  PhotoRepository.swift
//  CVSCodingChallenge
//
//  Created by Padraic Burnson 09/07/2024.
//

import Foundation

protocol PhotoRepositoryProtocol {
    func getPhotosData(withSearchTerm: String) async throws -> PhotoSearchData
}

final class PhotoRepository {
    private let apiService: APIServiceManagerProtocol
    init(apiService: APIServiceManagerProtocol = APIServiceManager()) {
        self.apiService = apiService
    }
}

extension PhotoRepository: PhotoRepositoryProtocol {
    func getPhotosData(withSearchTerm: String) async throws -> PhotoSearchData {
        guard let url = URL(string: "\(APIEndPoints.BaseURL)\(APIEndPoints.SearchPath)\(withSearchTerm)") else {
            throw APIServiceError.invalidURL
        }
        return try await apiService.getDataForRequest(url:url, type: PhotoSearchData.self)
    }
}
