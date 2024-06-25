//
//  File.swift
//  
//
//  Created by Amr Magdy on 25/06/2024.
//

import Foundation
import Models

public protocol UniversityDetailsPresenterProtocol: AnyObject {
    var view: UniversityDetailsViewProtocol? { get set }
    var interactor: UniversityDetailsInteractorInputProtocol? { get set }
    var router: UniversityDetailsRouterProtocol? { get set }
    func viewDidLoad()
}

public class UniversityDetailsPresenter: UniversityDetailsPresenterProtocol {
    public weak var view: UniversityDetailsViewProtocol?
    public var interactor: UniversityDetailsInteractorInputProtocol?
    public var router: UniversityDetailsRouterProtocol?
    
    public init() {}
    
    public func viewDidLoad() {
        interactor?.getUniversityDetails()
    }
}

extension UniversityDetailsPresenter: UniversityDetailsInteractorOutputProtocol {
    public func didRetrieveUniversityDetails(_ details: University) {
        view?.showUniversityDetails(details)
    }
}
