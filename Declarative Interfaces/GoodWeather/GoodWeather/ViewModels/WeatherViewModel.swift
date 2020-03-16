//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Terry Dengis on 10/30/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    private var weatherService: WeatherService!
    
    @Published var weather = Weather ()
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format:"%.0f", temp)
        } else {
            return ""
        }
    }
 
    var humidity: String {
        if let humidity = self.weather.humidity {
            return String(format:"%.0f", humidity)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""

    init () {
        weatherService = WeatherService ()
    }
    
    func search () {
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather (by city: String) {
        
        self.weatherService.getWeather(city: city) {weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
                
            }
        }
    }
}
