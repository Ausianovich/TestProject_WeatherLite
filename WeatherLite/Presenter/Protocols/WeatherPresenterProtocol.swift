//
//  WeatherPresenterProtocol.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation

protocol WeatherPresenterProtocol {
    var delegate: DayForecastViewDelegate? {get set}
    func fetchCurrentPositionWeather()
    func fetchWeather(with cityName: String)
}
