//
//  LocationNameEngine.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation
import CoreLocation

protocol LocationEngine {
    typealias Handler = ([CLPlacemark]?, Error?) -> Void
    func fetchName(with location: CLLocation, completionHandler: @escaping Handler)
    func fetchLocation(with city: String, completionHandler: @escaping Handler)
}
