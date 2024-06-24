//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//
//
//import Foundation
//import Networking
//import Models
//import LocalCaching
//
//public protocol UniversitiesListInteractorInputProtocol: AnyObject {
//    func fetchUniversities()
//    func refreshUniversities()
//}
//
//public protocol UniversitiesListInteractorOutputProtocol: AnyObject {
//    func didFetchUniversities(_ universities: [University])
//    func didFailWithError(_ error: String)
//}
//
//public class UniversitiesListInteractor: UniversitiesListInteractorInputProtocol {
//    weak var presenter: UniversitiesListInteractorOutputProtocol?
//    private let cacheManager: CacheManager<University>
//    
//    public init() {
//        do {
//            self.cacheManager = try CacheManager<University>()
//        } catch {
//            fatalError("Failed to initialize CacheManager: \(error)")
//        }
//    }
//    
//    public func fetchUniversities() {
//        let endpoint = UniversitiesEndpoint()
//        NetworkService().sendRequest(endpoint: endpoint) { [weak self] (result: Result<[University], NetworkError>) in
//            switch result {
//            case .success(let universities):
//                do {
//                    try self?.cacheManager.cache(universities)
//                } catch {
//                    self?.presenter?.didFailWithError("Failed to cache data: \(error.localizedDescription)")
//                }
//                self?.presenter?.didFetchUniversities(universities)
//            case .failure(let error):
//                do {
//                    let cachedUniversities = try self?.cacheManager.fetch() ?? []
//                    if !cachedUniversities.isEmpty {
//                        self?.presenter?.didFetchUniversities(cachedUniversities)
//                    } else {
//                        self?.presenter?.didFailWithError("Failed to fetch data: \(error.localizedDescription)")
//                    }
//                } catch {
//                    self?.presenter?.didFailWithError("Failed to fetch cached data: \(error.localizedDescription)")
//                }
//            }
//        }
//    }
//
//    public func refreshUniversities() {
//        fetchUniversities()
//    }
//}
//
//struct UniversitiesEndpoint: EndPoint {
//    var scheme: String
//    
//    var header: [String : String]?
//    
//    var body: [String : String]?
//    
//    var pathParams: [String : String]?
//    
//    var host: String = "universities.hipolabs.com"
//    var path: String = "/search"
//    var method: RequestMethod = .get
//    var queryParams: [String : String]? = ["country": "United Arab Emirates"]
//}
