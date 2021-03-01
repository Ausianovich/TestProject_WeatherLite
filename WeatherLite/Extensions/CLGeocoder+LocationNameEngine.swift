//
//  CLGeocoder+LocationNameEngine.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation
import CoreLocation

extension CLGeocoder: LocationNameEngine {
    typealias Handler = ([CLPlacemark]?, Error?) -> Void
    func fetchLocationName(with location: CLLocation, completionHandler: @escaping Handler) {
        self.reverseGeocodeLocation(location, completionHandler: completionHandler)
    }
}
