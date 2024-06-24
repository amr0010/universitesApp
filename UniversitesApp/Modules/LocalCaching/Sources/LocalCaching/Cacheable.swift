//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import RealmSwift

public protocol Cacheable {
    associatedtype RealmType: Object
    
    var realmObject: RealmType { get }
    init(realmObject: RealmType)
}
