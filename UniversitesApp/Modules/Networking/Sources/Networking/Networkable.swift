//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import Foundation
import Alamofire

public protocol Networkable {
    func sendRequest<T: Decodable>(endpoint: EndPoint, resultHandler: @escaping (Result<T, NetworkError>) -> Void)
}
