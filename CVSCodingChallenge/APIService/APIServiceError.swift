//
//  APIServiceError.swift
//  CVSCodingChallenge
//
//  Created by Padraic Burns on 09/07/2024.
//

import Foundation

enum APIServiceError: Error {
    case dataNotFound
    case invalidURL
    case responseError(Int)
    case parsingError
}
