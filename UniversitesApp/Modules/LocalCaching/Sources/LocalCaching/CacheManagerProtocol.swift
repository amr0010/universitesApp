//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import Foundation
import RealmSwift

public protocol CacheManagerProtocol {
    func add<T: Object>(_ object: T) throws
    func get<T: Object>(_ type: T.Type) throws -> Results<T>
    func getAll<T: Object>(_ type: T.Type) throws -> [T]
    func delete<T: Object>(_ object: T) throws
}
