//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import UIKit
import Models
import UniversityDetails

public protocol UniversitiesListRouterProtocol: AnyObject {
    func presentDetailsScreen(from view: UniversitiesListViewProtocol, forUniversity university: University)
}

public class UniversitiesListRouter: UniversitiesListRouterProtocol {
    public init() {}
    
    public func presentDetailsScreen(from view: UniversitiesListViewProtocol, forUniversity university: University) {
        guard let viewController = view as? UIViewController else { return }
             let detailsViewController = UniversityDetailsRouter.createUniversityDetailsModule(for: university)
             viewController.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
