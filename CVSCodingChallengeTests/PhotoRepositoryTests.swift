//
//  PhotoRepositoryTests.swift
//  CVSCodingChallengeTests
//
//  Created by Padraic Burns on 09/07/2024.
//

import XCTest
@testable import CVSCodingChallenge

final class PhotoRepositoryTests: XCTestCase {

    var photoRepository: PhotoRepository!
    var serviceManager: FakeAPIServiceManager!
    
    override func setUpWithError() throws {
        serviceManager = FakeAPIServiceManager()
        photoRepository = PhotoRepository(apiService: serviceManager)
    }

    override func tearDownWithError() throws {
        serviceManager = nil
        photoRepository = nil
    }

    func testGetPhotosData_success() async throws {
        // Given
        serviceManager.mockPath = "PhotosTestData"
        
        // When
        let data = try await photoRepository.getPhotosData(withSearchTerm: "cat")
        
        //Then
        XCTAssertNotNil(serviceManager)
        XCTAssertNotNil(photoRepository)
        XCTAssertEqual(data.items.count, 3)

    }
    
    func testGetListOfDigimon_whenNotExpectingData() async throws {
        // Given
        serviceManager.mockPath = "PhotosTestWrongJsonData"
        
        do {
            // When
            let data = try await photoRepository.getPhotosData(withSearchTerm: "cat")
            
            // Then
            XCTAssertNotNil(serviceManager)
            XCTAssertNotNil(photoRepository)
            XCTAssertEqual(data.items.count, 0)
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
    func testGetListOfDigimon_whenExpectingNoData() async throws {
        // Given
        serviceManager.mockPath = "PhotosTestDataNoData"
        
        do {
            // When
            let data = try await photoRepository.getPhotosData(withSearchTerm: "cat")
            
            // Then
            XCTAssertNotNil(serviceManager)
            XCTAssertNotNil(photoRepository)
            XCTAssertEqual(data.items.count, 0)
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
