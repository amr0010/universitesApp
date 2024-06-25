//
//  File.swift
//  
//
//  Created by Amr Magdy on 25/06/2024.
//

import XCTest
import UniversitiesList
import Models
import Networking

class MockPresenter: UniversitiesListInteractorOutputProtocol {
    var universities: [University] = []
    var didFail = false

    func didFetchUniversities(_ universities: [University]) {
        self.universities = universities
    }

    func didFailWithError(_ error: String) {
        didFail = true
    }
}
