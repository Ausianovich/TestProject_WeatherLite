//
//  LocationManager.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation
import CoreLocation

class LocationManager {
    enum LocationNameResult {
        case error(Error)
        case cityName(String)
    }
    
    enum LocationCoordinateResult {
        case error(Error)
        case coordinate(CLLocationCoordinate2D)
    }
    
    private var geocoder: LocationEngine
    
    init(geocoder: LocationEngine = CLGeocoder()) {
        self.geocoder = geocoder
    }
    
    func getLocationName(with latitude: Double, and longitude: Double, completionHandler: @escaping (LocationNameResult) -> Void) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        self.geocoder.fetchName(with: location) { (placemarks, error) in
            if let error = error {
                completionHandler(.error(error))
            }
            guard let cityName = placemarks?.first?.locality,
                  let countryName = placemarks?.first?.country else {return}
            
            let locationName = cityName + ", " + countryName
            completionHandler(.cityName(locationName))
        }
    }
    
    func getLocationCoordinate(with cityName: String, completionHandler: @escaping (LocationCoordinateResult) -> Void) {
        print(cityName)
        self.geocoder.fetchLocation(with: cityName) { (placeMarks, error) in
            if let error = error {
                completionHandler(.error(error))
            }
            guard let coordinate = placeMarks?.first?.location?.coordinate else {return}
            completionHandler(.coordinate(coordinate))
        }
    }
}
