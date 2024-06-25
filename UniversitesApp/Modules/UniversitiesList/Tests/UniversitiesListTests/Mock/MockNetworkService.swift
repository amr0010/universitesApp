//
//  File.swift
//  
//
//  Created by Amr Magdy on 25/06/2024.
//

import Foundation
import XCTest
import LocalCaching
import Models
import Networking
import RealmSwift

class MockNetworkService: Networkable {
    var result: Result<[University], NetworkError>?

    func sendRequest<T>(endpoint: EndPoint, resultHandler completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        if let result = result as? Result<T, NetworkError> {
            completion(result)
        }
    }
}
