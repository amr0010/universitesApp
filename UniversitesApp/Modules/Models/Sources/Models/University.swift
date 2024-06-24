//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import Foundation
import LocalCaching
import RealmSwift

public struct University: Codable {
    public let name: String
    public let country: String
    public let webPages: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case country
        case webPages = "web_pages"
    }

    public init(name: String, country: String, webPages: [String]) {
        self.name = name
        self.country = country
        self.webPages = webPages
    }
}

extension University: Cacheable {
    public var realmObject: RealmUniversity {
        return RealmUniversity(name: name, country: country, webPages: webPages)
    }
    
    public init(realmObject: RealmUniversity) {
        self.name = realmObject.name
        self.country = realmObject.country
        self.webPages = Array(realmObject.webPages)
    }
}
