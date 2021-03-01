//
//  CurrentLocationManager.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation
import CoreLocation

class CurrentLocationManager: NSObject, CurrentLocationProtocol {
    private var locationManager: CLLocationManager?
    
    var completionHandler: ((Double, Double) -> Void)?
    
    init(locationManager: CLLocationManager = CLLocationManager()){
        super.init()
        self.locationManager = locationManager
        self.locationManager?.delegate = self
    }
    
    func getCurrentLocation() {
        self.locationManager?.requestWhenInUseAuthorization()
        self.locationManager?.requestLocation()
    }
}

extension CurrentLocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.locationManager?.stopUpdatingLocation()
        guard let completion = self.completionHandler else {return}
        completion(location.coordinate.latitude, location.coordinate.longitude)
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .authorizedWhenInUse {
                self.locationManager?.requestLocation()
            }
        }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
