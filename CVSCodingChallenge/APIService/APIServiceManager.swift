//
//  APIServiceManager.swift
//  CVSCodingChallenge
//
//  Created by Padraic Burns on 09/07/2024.
//

import Foundation

struct APIServiceManager {
    private let urlSession: URLSession
    init(urlSession: URLSession = URLSession.shared ) {
        self.urlSession = urlSession
    }
}

extension APIServiceManager: APIServiceManagerProtocol{
    func getDataForRequest<T>(url: URL, type: T.Type) async throws -> T where T : Decodable {
        let (data, respone) = try await urlSession.data(from: url)
        guard let httpResponse = (respone as? HTTPURLResponse)else{
            throw APIServiceError.dataNotFound
        }
        guard (200...299).contains(httpResponse.statusCode) else{
            throw APIServiceError.responseError(httpResponse.statusCode)
        }
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try jsonDecoder.decode(type, from: data)
    }
}
