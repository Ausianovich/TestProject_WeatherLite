//
//  HourlyWeatherPresenterProtocol.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation

protocol HourlyWeatherPresenterProtocol {
    var delegate: HourlyForecastViewDelegate? {get set}
    func fetchCurrentPositionWeather()
    func fetchWeather(with cityName: String)
}
