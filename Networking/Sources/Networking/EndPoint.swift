//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import Foundation

public protocol EndPoint {
    var host: String { get }
    var scheme: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryParams: [String: String]? { get }
    var pathParams: [String: String]? { get }
}

extension EndPoint {
    var scheme: String {
        return "https"
    }
}

