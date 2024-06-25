//
//  File.swift
//  
//
//  Created by Amr Magdy on 25/06/2024.
//

import Foundation
import Models
import UniversityDetails

class MockPresenter: UniversityDetailsInteractorOutputProtocol {
    var details: University?

    func didRetrieveUniversityDetails(_ details: University) {
        self.details = details
    }
}
