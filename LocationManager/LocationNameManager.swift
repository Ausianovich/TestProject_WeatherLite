//
//  LocationManager.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation
import CoreLocation

class LocationNameManager {
    enum LocationResult {
        case error(Error)
        case cityName(String)
    }
    
    private var geocoder: LocationNameEngine
    
    init(geocoder: LocationNameEngine = CLGeocoder()) {
        self.geocoder = geocoder
    }
    func getLocationName(with latitude: Double, and longitude: Double, completionHandler: @escaping (LocationResult) -> Void) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        self.geocoder.fetchLocationName(with: location) { (placemarks, error) in
            if let error = error {
                completionHandler(.error(error))
            }
            guard let cityName = placemarks?.first?.locality,
                  let countryName = placemarks?.first?.country else {return}
            
            let locationName = cityName + ", " + countryName
            completionHandler(.cityName(locationName))
        }
    }
}
