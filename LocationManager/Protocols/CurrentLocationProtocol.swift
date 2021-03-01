//
//  CurrentLocationProtocol.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation

protocol CurrentLocationProtocol {
    var completionHandler: ((Double, Double) -> Void)? {get set}
    func getCurrentLocation()
}
