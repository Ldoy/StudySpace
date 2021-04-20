//
//  WeatherDataSource.swift
//  WeatherApp
//
//  Created by Do Yi Lee on 2021/04/20.
//

import Foundation
import CoreLocation

class WeatherDataSource {
    static let shared = WeatherDataSource()
    private init() { }
    
    var summary: CurrentWeather? // 현재날씨 저장
    var forcast: Forcast? // 예보날씨 저장
    let apiQueue = DispatchQueue(label: "ApiQueue", attributes: .concurrent) //디스패치 큐 저장

    let group = DispatchGroup()
    //두개의 api요청을 하나의 논리적인 그룹으로 묶어줄때 사용(디스패치)
    
    func fetch(location: CLLocation, completion: @escaping() -> ()) {
        group.enter()
        apiQueue.async {
        }
    }
}
// 하나의 인스턴스를 싱글톤으로 공유?

extension WeatherDataSource {
    private func fetch<ParsingType: Codable>(urlStr: String, completion: @escaping (Result<ParsingType, Error>) -> ()) {
        guard let url = URL(string: urlStr) else {
            completion(.failure(ApiError.invalidUrl(urlStr)))
            return
        }
        
       
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(ApiError.invalidResponse))
            return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(ApiError.failed(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(ApiError.emptyData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(ParsingType.self, from: data)
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    private func fetchCurrentWeather(cityName: String, completion: @escaping (Result<CurrentWeather, Error>) -> ()) {
            let urlStr =
            "http://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)&units=metric&lang=kr"
            
            fetch(urlStr: urlStr, completion: completion)
        }
        
    private func fetchCurrentWeather(cityId: Int, completion: @escaping (Result<CurrentWeather, Error>) -> ()) {
            let urlStr =
            "http://api.openweathermap.org/data/2.5/weather?id=\(cityId)&appid=\(apiKey)&units=metric&lang=kr"
            fetch(urlStr: urlStr, completion: completion)
        }
        
    private func fetchCurrentWeather(location: CLLocation, completion: @escaping (Result<CurrentWeather, Error>) -> ()) {
            let urlStr =
                "http://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=\(apiKey)&units=metric&lang=kr"
            
            fetch(urlStr: urlStr, completion: completion)
        }
    }
    





extension WeatherDataSource {
    private func fetchForcast(cityName: String, completion: @escaping (Result<Forcast, Error>) -> ()) {
        let urlStr = "http://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(apiKey)&units=metric&lang=kr"
        
        fetch(urlStr: urlStr, completion: completion)
    }
    
    private func fetchForcast(cityId: Int, completion: @escaping (Result<Forcast, Error>) -> ()) {
        let urlStr =
        "http://api.openweathermap.org/data/2.5/forcast?id=\(cityId)&appid=\(apiKey)&units=metric&lang=kr"
        
        fetch(urlStr: urlStr, completion: completion)
    }

    private func fetchForcast(location: CLLocation, completion: @escaping (Result<Forcast, Error>) -> ()) {
        let urlStr =
            "http://api.openweathermap.org/data/2.5/forcast?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=\(apiKey)&units=metric&lang=kr"
        fetch(urlStr: urlStr, completion: completion)
    }
}

