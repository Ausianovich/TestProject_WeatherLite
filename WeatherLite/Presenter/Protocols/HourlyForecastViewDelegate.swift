//
//  HourlyForecastViewDelegate.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation

protocol HourlyForecastViewDelegate {
    func updateHourlyForecastViewController(with: HourlyWeatherDTO)
    func show(_ error: Error)
}
