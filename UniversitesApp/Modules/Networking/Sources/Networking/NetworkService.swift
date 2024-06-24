//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import Foundation
import Alamofire

public final class NetworkService: Networkable {
    public init() {}

    public func sendRequest<T: Decodable>(endpoint: EndPoint, resultHandler: @escaping (Result<T, NetworkError>) -> Void) {
        guard let urlRequest = createRequest(endPoint: endpoint) else {
            resultHandler(.failure(.invalidURL))
            return
        }
        let urlTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                resultHandler(.failure(.invalidURL))
                return
            }
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                resultHandler(.failure(.unexpectedStatusCode))
                return
            }
            guard let data = data else {
                resultHandler(.failure(.unknown))
                return
            }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                resultHandler(.failure(.decode))
                return
            }
            resultHandler(.success(decodedResponse))
        }
        urlTask.resume()
    }

    private func createRequest(endPoint: EndPoint) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = endPoint.scheme
        urlComponents.host = endPoint.host
        urlComponents.path = endPoint.path

        if let queryParams = endPoint.queryParams {
            urlComponents.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        }

        guard let url = urlComponents.url else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        request.allHTTPHeaderFields = endPoint.header

        if let body = endPoint.body {
            let encoder = JSONEncoder()
            request.httpBody = try? encoder.encode(body)
        }

        return request
    }
}
