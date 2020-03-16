//
//  Weather.swift
//  GoodWeather
//
//  Created by Terry Dengis on 10/30/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather : Decodable {
    
    var temp: Double?
    var humidity: Double?
}
