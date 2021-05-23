//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Do Yi Lee on 2021/04/20.
//

import Foundation

struct CurrentWeather: Codable {
    
    let dt: Int
  
    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String

    }
    
    let weather: [Weather]
    
    struct Main: Codable {
        let temp: Double
        let temp_min : Int
        let temp_max :Int
    }
    
    let main : Main
}

