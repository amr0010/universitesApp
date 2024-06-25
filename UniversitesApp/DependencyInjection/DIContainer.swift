//
//  DIContainer.swift
//  UniversitesApp
//
//  Created by Amr Magdy on 25/06/2024.
//

import Foundation
import Networking
import LocalCaching
import UniversitiesList
import UniversityDetails

class DIContainer {
    static let shared = DIContainer()

    private init() {}

    // Networking
    lazy var networkService: Networkable = {
        NetworkService()
    }()

    // Cache Manager
    var cacheManager: CacheManagerProtocol = {
       return CacheManager()
    }()

    // UniversitiesList Module
    func makeUniversitiesListInteractor() -> UniversitiesListInteractorInputProtocol {
        let interactor = UniversitiesListInteractor(country: "United Arab Emirates", cacheManager: cacheManager, networkService: networkService)
        return interactor
    }

    func makeUniversitiesListPresenter() -> UniversitiesListPresenterProtocol & UniversitiesListInteractorOutputProtocol {
        return UniversitiesListPresenter()
    }

    func makeUniversitiesListRouter() -> UniversitiesListRouterProtocol {
        return UniversitiesListRouter()
    }
}
