//
//  Common.swift
//  WeatherApp
//
//  Created by Do Yi Lee on 2021/04/06.
//

import Foundation

let apiKey = "9cda367698143794391817f65f81c76e"

//https://home.openweathermap.org 에서 받은 API Key

/* JSON파일
{
    "coord": {
        "lon": 127.0706,
        "lat": 37.1522
    }, // 좌표
    "weather": [
        {
            "id": 800, // 날씨의 상태
            "main": "Clear", // 현재 날씨
            "description": "clear sky", // 상세날씨
            "icon": "01n"
        }
    ],
    "base": "stations",
    "main": {
        "temp": 286.5,
        "feels_like": 285.74,
        "temp_min": 284.15,
        "temp_max": 290.15,
        "pressure": 1019,
        "humidity": 71
    },
    "visibility": 10000,
    "wind": {
        "speed": 2.57,
        "deg": 250
    },
    "clouds": {
        "all": 1
    },
    "dt": 1617707037,
    "sys": {
        "type": 1,
        "id": 8099,
        "country": "KR",
        "sunrise": 1617657018,
        "sunset": 1617703062
    },
    "timezone": 32400,
    "id": 1839652,
    "name": "Osan",
    "cod": 200
}
*/

