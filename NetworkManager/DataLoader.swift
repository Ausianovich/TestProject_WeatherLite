//
//  DataLoader.swift
//  WeatherLite
//
//  Created by Ausianovich Kanstantsin on 28.02.2021.
//

import Foundation

struct DataLoader {
    enum Result {
        case data(Data)
        case error(Error)
    }
    private let engine: NetworkEngine
    
    init(engine: NetworkEngine = URLSession.shared){
        self.engine = engine
    }
    
    func loadData(with url: URL, completionHandler: @escaping (Result)-> Void){
        self.engine.performRequest(with: url) { (data, responce, error) in
            if let error = error {
                completionHandler(.error(error))
            }
            DispatchQueue.main.async {
                completionHandler(.data(data ?? Data()))
            }
        }
    }
}
