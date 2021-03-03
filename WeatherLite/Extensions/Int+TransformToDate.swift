//
//  Int+TransformToDate.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 03.03.2021.
//

import Foundation

extension Int {
    func transformToStringDate(with dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let date = Date(timeIntervalSince1970: Double(self))
        return date.transformToString(with: dateFormat)
    }
    
    func transformToDate() -> Date {
        return Date(timeIntervalSince1970: Double(self))
    }
    
}
