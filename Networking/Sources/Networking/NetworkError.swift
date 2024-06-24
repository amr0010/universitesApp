//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case unexpectedStatusCode
    case decode
    case unknown
}
