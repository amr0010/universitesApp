//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import XCTest
@testable import Models

class UniversityTests: XCTestCase {

    func testUniversityInitialization() {
        let university = University(name: "Test University", country: "Test Country", webPages: ["http://test.com"])
        XCTAssertEqual(university.name, "Test University")
        XCTAssertEqual(university.country, "Test Country")
        XCTAssertEqual(university.webPages, ["http://test.com"])
    }

    func testUniversityDecoding() throws {
        let json = """
        {
            "name": "Test University",
            "country": "Test Country",
            "web_pages": ["http://test.com"]
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let university = try decoder.decode(University.self, from: json)
        XCTAssertEqual(university.name, "Test University")
        XCTAssertEqual(university.country, "Test Country")
        XCTAssertEqual(university.webPages, ["http://test.com"])
    }
}
