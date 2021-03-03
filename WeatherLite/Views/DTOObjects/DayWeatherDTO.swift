//
//  DayWeatherDTO.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation

struct DayWeatherDTO {
    var location: String?
    var timeCode: String?
    var temperature: String?
    var pressure: String?
    var humidity: String?
    var windSpeed: String?
    var windDerection: String?
    var weatherCondition: String?
    var rain: String?
    var weatherDescription: String?
    var date: Date?
    
    var windDirectionString: String {
        guard let derection = self.windDerection else {return ""}
        switch derection {
            case "350", "360", "010": return "N"
            case "20", "30": return "N/NE"
            case "40", "50": return "NE"
            case "60", "70": return "E/NE"
            case "80", "90", "100": return "E"
            case "110", "120": return "E/SE"
            case "130", "140": return "SE"
            case "150", "160": return "S/SE"
            case "170", "180", "190": return "S"
            case "200", "210": return "S/SW"
            case "220", "230": return "SW"
            case "240", "250": return "W/SW"
            case "260", "270", "280": return "W"
            case "290", "300": return "W/NW"
            case "310", "320": return "NW"
            case "330", "340": return "N/NW"
            default: return ""
                
        }
    }
}
