//
//  FakeAPIServiceManager.swift
//  CVSCodingChallengeTests
//
//  Created by Padraic Burns on 09/07/2024.
//

import Foundation
@testable import CVSCodingChallenge

class FakeAPIServiceManager: APIServiceManagerProtocol {
    var mockPath: String = ""

    func getDataForRequest<T>(url: URL, type: T.Type) async throws -> T where T : Decodable {
        let bundle = Bundle(for: FakeAPIServiceManager.self)
        guard let path = bundle.url(forResource: mockPath, withExtension: "json") else {
            throw APIServiceError.invalidURL
        }
        do {
            let data = try Data(contentsOf: path)
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let parsedData = try jsonDecoder.decode(type, from: data)
            return parsedData
        } catch {
            throw APIServiceError.dataNotFound
        }
    }
}
