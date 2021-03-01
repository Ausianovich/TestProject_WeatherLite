//
//  URLSession+FetchData.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 28.02.2021.
//

import Foundation

extension URLSession: NetworkEngine {
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    func performRequest(with url: URL, completionHandler: @escaping Handler) {
        let task = self.dataTask(with: url, completionHandler: completionHandler)
        task.resume()
    }
}
