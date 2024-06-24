//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import Foundation

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
