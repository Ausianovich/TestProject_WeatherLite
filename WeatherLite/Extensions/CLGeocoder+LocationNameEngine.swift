//
//  CLGeocoder+LocationNameEngine.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation
import CoreLocation

extension CLGeocoder: LocationEngine {
    typealias Handler = ([CLPlacemark]?, Error?) -> Void
    func fetchName(with location: CLLocation, completionHandler: @escaping Handler) {
        self.reverseGeocodeLocation(location, completionHandler: completionHandler)
    }
    func fetchLocation(with city: String, completionHandler: @escaping Handler) {
        self.geocodeAddressString(city, completionHandler: completionHandler)
    }
}
