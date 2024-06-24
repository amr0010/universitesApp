//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import Foundation

public enum CacheManagerError: Error {
    case initializationFailed(String)
    case writeFailed(String)
    case fetchFailed(String)
}
