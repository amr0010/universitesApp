//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import Foundation
import RealmSwift

public class CacheManager<T: Cacheable> {
    private let realm: Realm

    public init() throws {
        do {
            self.realm = try Realm()
        } catch {
            throw CacheManagerError.initializationFailed("Failed to initialize Realm: \(error.localizedDescription)")
        }
    }
    
    public func cache(_ items: [T]) throws {
        do {
            try realm.write {
                realm.add(items.map { $0.realmObject }, update: .modified)
            }
        } catch {
            throw CacheManagerError.writeFailed("Failed to write items to Realm: \(error.localizedDescription)")
        }
    }
    
    public func fetch() throws -> [T] {
        do {
            let realmObjects = realm.objects(T.RealmType.self)
            return realmObjects.map { T(realmObject: $0) }
        } catch {
            throw CacheManagerError.fetchFailed("Failed to fetch items from Realm: \(error.localizedDescription)")
        }
    }
}
