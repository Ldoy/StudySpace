//
//  Forcast.swift
//  WeatherApp
//
//  Created by Do Yi Lee on 2021/04/20.
//

import Foundation

struct Forcast: Codable {

    struct ListItem : Codable {
        
        let dt: Int
        
        struct Main: Codable {
            let temp: Double
        }
        let main: Main
        
        struct Weather: Codable {
            let description: String
            let icon: String
        }
        let weather: [Weather]
    }
    
    let list: [ListItem]
    
}
