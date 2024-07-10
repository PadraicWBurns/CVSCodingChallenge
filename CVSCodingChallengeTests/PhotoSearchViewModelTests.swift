//
//  CVSCodingChallengeTests.swift
//  CVSCodingChallengeTests
//
//  Created by Padraic Burns on 7/9/24.
//

import XCTest
@testable import CVSCodingChallenge

final class PhotoSearchViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_PhotoSearchViewModel_getSearchedPhotosWithText_photosNotEmpty() async {
        // Given
        let sut = PhotoSearchViewModel(repository: PhotoRepositoryStub())
        
        // when
        await sut.getSearchedPhotosWithText(searchTerm: "test")

        // then
        XCTAssertEqual(sut.homeViewState, HomeViewState.load(PhotoSearchData.photos.items))

    }
}

extension HomeViewState: Equatable {
    public static func == (lhs: CVSCodingChallenge.HomeViewState, rhs: CVSCodingChallenge.HomeViewState) -> Bool {
        switch (lhs , rhs) {
        case (.load(let lhsItems), .load(let rhsItems)):
            return lhsItems.count == rhsItems.count
        case (.error , .error):
            return false
        case (.load(let lhsItems), .error):
            return false
        case (.error, .load(_)):
            return false
        }
    }
}
