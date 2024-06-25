//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import UIKit
import Models

public protocol UniversitiesListRouterProtocol: AnyObject {
    func presentDetailsScreen(from view: UniversitiesListViewProtocol, forUniversity university: University)
}

public class UniversitiesListRouter: UniversitiesListRouterProtocol {
    public init() {}
    
    public func presentDetailsScreen(from view: UniversitiesListViewProtocol, forUniversity university: University) {
       
    }
}
