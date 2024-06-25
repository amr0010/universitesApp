//
//  File.swift
//  
//
//  Created by Amr Magdy on 25/06/2024.
//

import Foundation
import Models

public protocol UniversityDetailsInteractorInputProtocol: AnyObject {
    var presenter: UniversityDetailsInteractorOutputProtocol? { get set }
    func getUniversityDetails()
}

public protocol UniversityDetailsInteractorOutputProtocol: AnyObject {
    func didRetrieveUniversityDetails(_ details: University)
}

public class UniversityDetailsInteractor: UniversityDetailsInteractorInputProtocol {
    weak public var presenter: UniversityDetailsInteractorOutputProtocol?
    private let university: University
    
    public init(university: University) {
        self.university = university
        getUniversityDetails()
    }
    
    public func getUniversityDetails() {
        presenter?.didRetrieveUniversityDetails(university)
    }
}
