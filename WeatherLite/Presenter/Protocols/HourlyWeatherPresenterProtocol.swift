//
//  HourlyWeatherPresenterProtocol.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation

protocol HourlyWeatherPresenterProtocol {
    var delegate: DayForecastViewDelegate? {get set}
    func fetchData()
}
