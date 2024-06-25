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
                let presenter: UniversitiesListPresenterProtocol & UniversitiesListInteractorOutputProtocol = UniversitiesListPresenter()
        let cacheManager: CacheManagerProtocol = CacheManager()
        let interactor: UniversitiesListInteractorInputProtocol = UniversitiesListInteractor(country: country, cacheManager: cacheManager, networkService: NetworkService(), presenter: presenter)
                let router: UniversitiesListRouterProtocol = UniversitiesListRouter()

                view.presenter = presenter
                presenter.view = view
                presenter.interactor = interactor
                presenter.router = router

                return view
     }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

