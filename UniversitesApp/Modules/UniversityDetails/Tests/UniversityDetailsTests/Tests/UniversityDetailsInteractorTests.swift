//
//  File.swift
//  
//
//  Created by Amr Magdy on 25/06/2024.
//

import XCTest
@testable import UniversityDetails
import Models

class UniversityDetailsInteractorTests: XCTestCase {
    var interactor: UniversityDetailsInteractor!
    var mockPresenter: MockPresenter!

    override func setUp() {
        super.setUp()
        let university = University(name: "Test University", country: "United Arab Emirates", webPages: ["http://test.com"])
        interactor = UniversityDetailsInteractor(university: university)
        mockPresenter = MockPresenter()
        interactor.presenter = mockPresenter
    }

    override func tearDown() {
        interactor = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testGetUniversityDetails() {
        interactor.getUniversityDetails()
        XCTAssertEqual(mockPresenter.details?.name, "Test University")
        XCTAssertEqual(mockPresenter.details?.country, "United Arab Emirates")
        XCTAssertEqual(mockPresenter.details?.webPages, ["http://test.com"])
    }
}

