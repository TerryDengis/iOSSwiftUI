//
//  WeatherService.swift
//  GoodWeather
//
//  Created by Terry Dengis on 10/30/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

class WeatherService {
    
        
        func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
            
            guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=73e0435f6672e591345a9fdc0ef1b7d0&units=metric") else {
                completion(nil)
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
            
        }.resume()
    }
}
