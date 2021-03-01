//
//  NetworkEngine.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 28.02.2021.
//

import Foundation

protocol NetworkEngine {
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    func performRequest(with url: URL, completionHandler: @escaping Handler)
}
