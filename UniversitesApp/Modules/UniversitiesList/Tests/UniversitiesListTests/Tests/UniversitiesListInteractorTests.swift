//
//  File.swift
//  
//
//  Created by Amr Magdy on 25/06/2024.
//

import XCTest
@testable import UniversitiesList
import Models
import Networking

class UniversitiesListInteractorTests: XCTestCase {
    var interactor: UniversitiesListInteractor!
    var mockCacheManager: MockCacheManager!
    var mockNetworkService: MockNetworkService!
    var mockPresenter: MockPresenter!

    override func setUp() {
        super.setUp()
        mockCacheManager = MockCacheManager()
        mockNetworkService = MockNetworkService()
        mockPresenter = MockPresenter()
        interactor = UniversitiesListInteractor(country: "United Arab Emirates", cacheManager: mockCacheManager, networkService: mockNetworkService, presenter: mockPresenter)
        interactor.presenter = mockPresenter
    }

    override func tearDown() {
        interactor = nil
        mockCacheManager = nil
        mockNetworkService = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testFetchUniversities_Success() {
        let universities = [University(name: "Test University", country: "United Arab Emirates", webPages: ["http://test.com"])]
        mockNetworkService.result = .success(universities)

        interactor.fetchUniversities()

        XCTAssertEqual(mockPresenter.universities.count, universities.count)
        XCTAssertFalse(mockPresenter.didFail)
    }

    func testFetchUniversities_FailureWithCache() {
        mockNetworkService.result = .failure(.unexpectedStatusCode)
        mockCacheManager.items = [RealmUniversity(name: "Cached University", country: "United Arab Emirates", webPages: ["http://cached.com"])]

        interactor.fetchUniversities()

        XCTAssertEqual(mockPresenter.universities.count, mockCacheManager.items.count)
        XCTAssertFalse(mockPresenter.didFail)
    }

    func testFetchUniversities_FailureWithoutCache() {
        mockNetworkService.result = .failure(.unexpectedStatusCode)
        mockCacheManager.items = []

        interactor.fetchUniversities()

        XCTAssertTrue(mockPresenter.didFail)
    }
}
