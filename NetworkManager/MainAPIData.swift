//
//  MainAPIData.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 28.02.2021.
//

import Foundation

class MainAPIData {
    var host: String =  "api.openweathermap.org"
    var path: String = "/data/2.5/onecall"
    var queryItems: [String: String] = [:]
    
    static var shared: MainAPIData = MainAPIData()
    
    private init() {
        self.setMainApiDataDictionary()
    }
    
    func setMainApiDataDictionary() {
        guard let path = Bundle.main.path(forResource: "WeatherAPI-Info", ofType: "plist") else {return}
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            guard let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String: String] else {return}
            self.queryItems = plist
        } catch {
            print(error.localizedDescription)
        }
    }
}
