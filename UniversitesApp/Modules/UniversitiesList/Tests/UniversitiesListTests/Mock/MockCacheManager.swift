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


class MockCacheManager: CacheManagerProtocol {
    var items: [Any] = []  
    var shouldThrowError = false

    func add<T: Object>(_ object: T) throws {
        if shouldThrowError {
            throw CacheManagerError.writeFailed("Mock write error")
        }
        items.append(object)
    }

    func get<T: Object>(_ type: T.Type) throws -> Results<T> {
        return try! Realm().objects(type)  // Not needed for this mock
    }

    func getAll<T: Object>(_ type: T.Type) throws -> [T] {
        if shouldThrowError {
            throw CacheManagerError.fetchFailed("Mock fetch error")
        }
        return items.compactMap { $0 as? T }
    }

    func delete<T: Object>(_ object: T) throws {}
}
