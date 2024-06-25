//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//
//
import Foundation
import Networking
import Models
import LocalCaching

public protocol UniversitiesListInteractorInputProtocol: AnyObject {
    func fetchUniversities()
    func refreshUniversities()
}

public protocol UniversitiesListInteractorOutputProtocol: AnyObject {
    func didFetchUniversities(_ universities: [University])
    func didFailWithError(_ error: String)
}

public class UniversitiesListInteractor: UniversitiesListInteractorInputProtocol {
    weak var presenter: UniversitiesListInteractorOutputProtocol?
    private let cacheManager: CacheManagerProtocol
    private let networkService: Networkable
    private let country: String
    
    public init(country: String, cacheManager: CacheManagerProtocol, networkService: Networkable, presenter: UniversitiesListInteractorOutputProtocol) {
        self.country = country
        self.cacheManager = cacheManager
        self.networkService = networkService
        self.presenter = presenter
    }
    
    public func fetchUniversities() {
        let endpoint = UniversitiesEndpoint(country: country)
        networkService.sendRequest(endpoint: endpoint) { [weak self] (result: Result<[University], NetworkError>) in
            switch result {
            case .success(let universities):
                self?.handleFetchSuccess(universities)
            case .failure(let error):
                self?.handleFetchFailure(error)
            }
        }
    }

    public func refreshUniversities() {
        fetchUniversities()
    }
    
    private func handleFetchSuccess(_ universities: [University]) {
        do {
            for university in universities {
                let realmUniversity = RealmUniversity(name: university.name, country: university.country, webPages: university.webPages)
                try cacheManager.add(realmUniversity)
            }
            presenter?.didFetchUniversities(universities)
        } catch {
            presenter?.didFailWithError("Failed to cache data: \(error.localizedDescription)")
        }
    }
    
    private func handleFetchFailure(_ error: NetworkError) {
        do {
            let cachedUniversities = try cacheManager.getAll(RealmUniversity.self).map { University(realmObject: $0) }
            if !cachedUniversities.isEmpty {
                presenter?.didFetchUniversities(cachedUniversities)
            } else {
                presenter?.didFailWithError("Failed to fetch data: \(error.localizedDescription)")
            }
        } catch {
            presenter?.didFailWithError("Failed to fetch cached data: \(error.localizedDescription)")
        }
    }
}
