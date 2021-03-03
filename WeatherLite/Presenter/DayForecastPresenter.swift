//
//  DayForecastPresenter.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 28.02.2021.
//

import Foundation
//import CoreLocation

class WeatherPresenter: WeatherPresenterProtocol {
    typealias Location = (latitude: Double, longitude: Double)
    
    var delegate: DayForecastViewDelegate?
    private var currentLocationManager: CurrentLocationProtocol
    private var locationNameManager: LocationNameManager
    private var dataLoader: DataLoader
    private var jsonDecoder = JSONDecoder()

    init(delegate: DayForecastViewDelegate,
         currentLocationManager: CurrentLocationProtocol = CurrentLocationManager(),
         locationNameManager: LocationNameManager = LocationNameManager(),
         dataLoader: DataLoader = DataLoader()) {
        self.delegate = delegate
        self.currentLocationManager = currentLocationManager
        self.locationNameManager = locationNameManager
        self.dataLoader = dataLoader
    }
    
    func fetchData() {
        self.currentLocationManager.completionHandler = { latitude, longitude in
            self.fetchWeather(with: (latitude, longitude))
        }
        self.currentLocationManager.getCurrentLocation()
    }

    func fetchWeather(with location: Location) {
        do {
            guard let url = try self.createURL(with: location) else {return}
            self.dataLoader.loadData(with: url) { (result) in
                switch result {
                    case .error(let error): self.delegate?.show(error)
                    case .data(let data):   self.parseJSON(from: data)
                }
            }
        } catch {
            self.delegate?.show(error)
        }
    }
    
    private func createURL(with locatoin: Location) throws -> URL? {
        do {
            let gueryItems = self.getQyeryItems(with: locatoin)
            return try URLBuilder()
                        .with(host: MainAPIData.shared.host)
                        .with(path: MainAPIData.shared.path)
                        .with(queryItems: gueryItems)
                        .build()
        } catch {
            throw error
        }
    }
    
    private func getQyeryItems(with location: Location) -> [String: String] {
        var queryItems: [String: String] = [:]
        queryItems["lat"] = location.latitude.description
        queryItems["lon"] = location.longitude.description
        queryItems.merge(MainAPIData.shared.queryItems,uniquingKeysWith: {(current, _) in current})
        return queryItems
    }
    
    func getLocationName(with latitude: Double, and longitude: Double, completion: @escaping (String) -> Void){
        self.locationNameManager.getLocationName(with: latitude, and: longitude) { (result) in
            switch result {
                case .error(let error): self.delegate?.show(error)
                case .cityName(let name): completion(name)
            }
        }
    }
    
    private func parseJSON(from data: Data) {
        do {
            let weather = try self.jsonDecoder.decode(WordDetailResponseModel.self, from: data)
            guard let currentWeather = weather.current else {return}
            self.getLocationName(with: weather.lat ?? 0 , and: weather.lon ?? 0) { (locationName) in
                guard let temperature = currentWeather.temp,
                      let pressure = currentWeather.pressure?.description,
                      let humidity = currentWeather.humidity?.description,
                      let windSpeed = currentWeather.windSpeed?.description,
                      let windDerection = currentWeather.windDeg?.description,
                      let weather = currentWeather.weather,
                      !weather.isEmpty,
                      let weatherCondition = weather[0].icon else {return}
                      
                
                
                
                
                let dayWeatherDTO = DayWeatherDTO(
                    location: locationName,
                    timeCode: nil,
                    temperature: Int(temperature).description,
                    pressure: pressure + ", hPa",
                    humidity: humidity + ", %",
                    windSpeed: windSpeed + " metre/sec",
                    windDerection: windDerection,
                    weatherCondition: weatherCondition,
                    rain: (currentWeather.rain?.the1H?.description ?? "0") + " mm")
                
                self.delegate?.updateDayForecastViewController(with: dayWeatherDTO)
            }
        } catch {
            self.delegate?.show(error)
        }
    }
}
