//
//  HourlyForecastViewController.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 01.03.2021.
//

import Foundation


final class HourlyForecastPresenter: HourlyWeatherPresenterProtocol {
    typealias Location = (latitude: Double, longitude: Double)
    
    var delegate: HourlyForecastViewDelegate?
    private var currentLocationManager: CurrentLocationProtocol
    private var locationNameManager: LocationNameManager
    private var dataLoader: DataLoader
    private var jsonDecoder = JSONDecoder()

    init(delegate: HourlyForecastViewDelegate,
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
    
    private func fetchWeather(with location: Location) {
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
    
    private func parseJSON(from data: Data) {
        do {
            let weather = try self.jsonDecoder.decode(WordDetailResponseModel.self, from: data)
            self.getLocationName(with: weather.lat ?? 0 , and: weather.lon ?? 0) { (locationName) in
                guard let data = weather.hourly else {return}
                let dto = data.map { hourlyWeather -> DayWeatherDTO in

                    guard let temperature = hourlyWeather.temp,
                          let timeCode = hourlyWeather.dt?.transformToStringDate(with: "HH:mm"),
                          let weather = hourlyWeather.weather,
                          !weather.isEmpty,
                          let weatherCondition = weather[0].icon,
                          let description = weather[0].currentWeatherDescription,
                          let date = hourlyWeather.dt?.transformToDate() else {return DayWeatherDTO()}
                    
                    return DayWeatherDTO(
                        location: locationName,
                        timeCode: timeCode,
                        temperature: Int(temperature).description,
                        weatherCondition: weatherCondition,
                        weatherDescription: description,
                        date: date)
                }
                
                let sectionedData = self.createDateSectionDTO(array: dto)
                let hourlyWeatherDTO = HourlyWeatherDTO(hourlyData: sectionedData, locationName: locationName)
                self.delegate?.updateHourlyForecastViewController(with: hourlyWeatherDTO)
            }
        } catch {
            self.delegate?.show(error)
        }
    }
    
    private func getLocationName(with latitude: Double, and longitude: Double, completion: @escaping (String) -> Void){
        self.locationNameManager.getLocationName(with: latitude, and: longitude) { (result) in
            switch result {
                case .error(let error): self.delegate?.show(error)
                case .cityName(let name): completion(name)
            }
        }
    }
    
    private func getQyeryItems(with location: Location) -> [String: String] {
        var queryItems: [String: String] = [:]
        queryItems["lat"] = location.latitude.description
        queryItems["lon"] = location.longitude.description
        queryItems.merge(MainAPIData.shared.queryItems,uniquingKeysWith: {(current, _) in current})
        return queryItems
    }
    
    private func createDateSectionDTO(array: [DayWeatherDTO]) -> [DaySectionsDTO] {
        let filteredArray = self.filterArrayForThreeHour(array: array)
        
        
        let daySections = filteredArray
                            .compactMap {$0.date?.startOfDay}
                            .unique()
                            .sorted(by: <)
                            .map { day -> DaySectionsDTO in
                                let hourlyData = filteredArray.filter {$0.date?.startOfDay == day}
                                return DaySectionsDTO(date: day,hourlyData: hourlyData)}
        return daySections
    }
    
    private func filterArrayForThreeHour(array: [DayWeatherDTO]) -> [DayWeatherDTO] {
        let filterDate = ["00", "03", "06", "09", "12","15" ,"18" , "21"]
        return array.filter {filterDate.contains($0.date?.transformToString(with: "HH") ?? "")}
    }
}


