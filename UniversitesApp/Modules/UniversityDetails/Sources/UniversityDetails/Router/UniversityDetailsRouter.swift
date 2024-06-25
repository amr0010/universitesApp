//
//  File.swift
//  
//
//  Created by Amr Magdy on 25/06/2024.
//

import UIKit
import Models

public protocol UniversityDetailsRouterProtocol: AnyObject {
    static func createUniversityDetailsModule(for university: University) -> UIViewController
}

public class UniversityDetailsRouter: UniversityDetailsRouterProtocol {
    public static func createUniversityDetailsModule(for university: University) -> UIViewController {
        let view = UniversityDetailsView()
        let presenter: UniversityDetailsPresenterProtocol & UniversityDetailsInteractorOutputProtocol = UniversityDetailsPresenter()
        let interactor: UniversityDetailsInteractorInputProtocol = UniversityDetailsInteractor(university: university)
        let router: UniversityDetailsRouterProtocol = UniversityDetailsRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return view
    }
}
