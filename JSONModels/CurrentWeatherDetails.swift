//
//  CurrentWeatherDetails.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation

struct CurrentWeatherDetails: Codable {
    let id: Int?
    let currentWeatherDescription: String?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case id
        case currentWeatherDescription = "description"
        case icon
    }
}
