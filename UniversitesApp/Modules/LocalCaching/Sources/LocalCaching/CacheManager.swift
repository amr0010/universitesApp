//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import Foundation
import RealmSwift

public class CacheManager: CacheManagerProtocol {
    private let queue: DispatchQueue = DispatchQueue(label: "com.cachemanager.realm")

    public init() {
        queue.async {
            do {
                _ = try Realm()
            } catch let error as NSError {
                fatalError("Failed to initialize Realm: \(error.localizedDescription)")
            }
        }
    }

    public func add<T: Object>(_ object: T) throws {
        try queue.sync {
            do {
                let realm = try Realm()
                try realm.write {
                    if let primaryKey = T.primaryKey() {
                        if realm.object(ofType: T.self, forPrimaryKey: object.value(forKey: primaryKey)!) != nil {
                            realm.add(object, update: .modified)
                        } else {
                            realm.add(object)
                        }
                    } else {
                        realm.add(object)
                    }
                }
            } catch {
                debugPrint("Failed to add or update object: \(error.localizedDescription)")
                throw CacheManagerError.writeFailed("Failed to write items to Realm: \(error.localizedDescription)")
            }
        }
    }

    public func get<T: Object>(_ type: T.Type) throws -> Results<T> {
        return try queue.sync {
            let realm = try Realm()
            return realm.objects(type)
        }
    }

    public func getAll<T: Object>(_ type: T.Type) throws -> [T] {
        return try queue.sync {
            let realm = try Realm()
            return Array(realm.objects(type))
        }
    }

    public func delete<T: Object>(_ object: T) throws {
       try queue.sync {
            do {
                let realm = try Realm()
                try realm.write {
                    if let primaryKey = T.primaryKey(), let existingObject = realm.object(ofType: T.self, forPrimaryKey: object.value(forKey: primaryKey)!) {
                        realm.delete(existingObject)
                    } else {
                        realm.delete(object)
                    }
                }
            } catch let error as NSError {
                debugPrint("Failed to delete object: \(error.localizedDescription)")
                throw error
            }
        }
    }
}
