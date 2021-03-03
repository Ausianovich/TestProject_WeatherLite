//
//  Array+Unique.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 03.03.2021.
//

import Foundation

extension Array where Element: Hashable {
    func unique() -> Self {
        return Array(Set(self))
    }
}
