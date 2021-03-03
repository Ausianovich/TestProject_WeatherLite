//
//  HourlyWeatherDTO.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation

struct HourlyWeatherDTO {
    var hourlyData: [DaySectionsDTO] = []
    var locationName: String
}
