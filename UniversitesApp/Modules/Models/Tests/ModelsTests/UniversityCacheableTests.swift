//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import XCTest
import RealmSwift
@testable import Models

class UniversityCacheableTests: XCTestCase {

    func testUniversityToRealmUniversity() {
        let university = University(name: "Test University", country: "Test Country", webPages: ["http://test.com"])
        let realmUniversity = university.realmObject
        
        XCTAssertEqual(realmUniversity.name, "Test University")
        XCTAssertEqual(realmUniversity.country, "Test Country")
        XCTAssertEqual(realmUniversity.webPages.first, "http://test.com")
    }
    
    func testRealmUniversityToUniversity() {
        let realmUniversity = RealmUniversity(name: "Test University", country: "Test Country", webPages: ["http://test.com"])
        let university = University(realmObject: realmUniversity)
        
        XCTAssertEqual(university.name, "Test University")
        XCTAssertEqual(university.country, "Test Country")
        XCTAssertEqual(university.webPages.first, "http://test.com")
    }
}
