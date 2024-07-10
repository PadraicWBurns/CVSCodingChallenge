//
//  APIServiceManagerActions.swift
//  CVSCodingChallenge
//
//  Created by Padraic Burns on 09/07/2024.
//

import Foundation

protocol APIServiceManagerProtocol {
    func getDataForRequest<T: Decodable>(url: URL, type: T.Type) async throws -> T
}
