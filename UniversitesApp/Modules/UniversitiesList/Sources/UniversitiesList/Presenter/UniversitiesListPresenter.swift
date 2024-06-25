//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import Foundation
import Models

public protocol UniversitiesListPresenterProtocol: AnyObject {
    var view: UniversitiesListViewProtocol? { get set }
    var interactor: UniversitiesListInteractorInputProtocol? { get set }
    var router: UniversitiesListRouterProtocol? { get set }
    func viewDidLoad()
    func showDetails(for university: University)
    func refreshButtonTapped()
}

public class UniversitiesListPresenter: UniversitiesListPresenterProtocol {
    public weak var view: UniversitiesListViewProtocol?
    public var interactor: UniversitiesListInteractorInputProtocol?
    public var router: UniversitiesListRouterProtocol?
    
    public init() {}
    
    public func viewDidLoad() {
        interactor?.fetchUniversities()
    }
    
    public func showDetails(for university: University) {
        router?.presentDetailsScreen(from: view!, forUniversity: university)
    }

    public func refreshButtonTapped() {
        interactor?.refreshUniversities()
    }
}

extension UniversitiesListPresenter: UniversitiesListInteractorOutputProtocol {
    public func didFetchUniversities(_ universities: [University]) {
        view?.showUniversities(universities)
    }
    
    public func didFailWithError(_ error: String) {
        view?.showError(error)
    }
}
