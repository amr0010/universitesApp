//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import Foundation
import RealmSwift

public class RealmUniversity: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var country: String = ""
    let webPages = List<String>()
    
    public convenience init(name: String, country: String, webPages: [String]) {
        self.init()
        self.name = name
        self.country = country
        self.webPages.append(objectsIn: webPages)
    }
    
    public override static func primaryKey() -> String? {
        return "name"
    }
}
