//
//  SceneDelegate.swift
//  UniversitesApp
//
//  Created by Amr Magdy on 24/06/2024.
//

import UIKit
import UniversitiesList
import Networking
import LocalCaching
import Models

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

               let window = UIWindow(windowScene: windowScene)
               let viewController = createUniversitiesListModule(country: "United Arab Emirates")
               window.rootViewController = UINavigationController(rootViewController: viewController)
               self.window = window
               window.makeKeyAndVisible()
    }
    
    private func createUniversitiesListModule(country: String) -> UIViewController {
        let view = UniversitiesListView()
        let presenter = DIContainer.shared.makeUniversitiesListPresenter()
        let interactor = DIContainer.shared.makeUniversitiesListInteractor()
        let router = DIContainer.shared.makeUniversitiesListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }

  

}

