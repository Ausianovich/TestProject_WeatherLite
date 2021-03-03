//
//  DaySectionDTO.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 03.03.2021.
//

import Foundation

struct DaySectionsDTO {
    var date: Date
    var dayOfWeek: String {
        self.date.transformToString(with: "EEEE")
    }
    var hourlyData: [DayWeatherDTO] = []
}
