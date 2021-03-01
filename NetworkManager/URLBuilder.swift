//
//  URLBuilder.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 28.02.2021.
//

import Foundation

final class URLBuilder: URLSupportable {
    
    var scheme = "https"
    var user: String?
    var password: String?
    var host: String?
    var port: Int?
    var path = ""
    var queryItems: [String : String]?
    
    func with(scheme: String) -> Self {
        self.scheme = scheme
        return self
    }
    
    func with(user: String) -> Self {
        self.user = user
        return self
    }
    
    func with(password: String) -> Self {
        self.password = password
        return self
    }
    
    func with(host: String) -> Self {
        self.host = host
        return self
    }
    
    func with(port: Int) -> Self {
        self.port = port
        return self
    }
    
    func with(path: String) -> Self {
        self.path = path
        return self
    }
    
    func with(queryItems: [String : String]) -> Self {
        self.queryItems = queryItems
        return self
    }
    
    func build() throws -> URL {
        guard let _ = self.host else { throw URLBuilderError.emptyHost }
        var urlComponents = URLComponents()
        urlComponents.scheme = self.scheme
        urlComponents.user = self.user
        urlComponents.password = self.password
        urlComponents.host = self.host
        urlComponents.port = self.port
        urlComponents.path = self.path
        urlComponents.queryItems = self.queryItems?.map {
            URLQueryItem(name: $0, value: $1)
        }
        
        guard let url = urlComponents.url else {throw URLBuilderError.systemError}
        return url
    }
        
    enum URLBuilderError: Error {
        case emptyHost
        case inconsistentCredentials
        case systemError
    }
}
