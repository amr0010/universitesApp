//
//  File.swift
//  
//
//  Created by Amr Magdy on 24/06/2024.
//

import Foundation
import Networking

struct UniversitiesEndpoint: EndPoint {
    var scheme: String = "http"
    
    var host: String
    
    var path: String
    
    var method: RequestMethod
    
    var header: [String: String]?
    
    var body: [String: String]?
    
    var queryParams: [String : String]?
    
    var pathParams: [String : String]?
    
    init(country: String) {
        self.host = "universities.hipolabs.com"
        
        self.path = "/search"
        
        self.method = .get
        
        self.header = nil
        
        self.body = nil
        
        self.queryParams = ["country": country]
        
        self.pathParams = nil
    }
}
