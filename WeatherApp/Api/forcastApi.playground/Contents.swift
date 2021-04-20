import UIKit
import CoreLocation

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



enum ApiError: Error {
    case unowned
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}


func fetch<ParsingType: Codable>(urlStr: String, completion: @escaping (Result<ParsingType, Error>) -> ()) {
    guard let url = URL(string: urlStr) else {
        completion(.failure(ApiError.invalidUrl(urlStr)))
        return
    }
    
    let task = URLSession.shared.dataTask(with: url)
        {
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

func fetchForcast(cityName: String, completion: @escaping (Result<Forcast, Error>) -> ()) {
    let urlStr = "http://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=9cda367698143794391817f65f81c76e&units=metric&lang=kr"
    
    fetch(urlStr: urlStr, completion: completion)
}


fetchForcast(cityName: "osan"){ (result) in
    switch result {
    case .success(let forcast):
        dump(forcast)
    case .failure(let error):
        print(error)
    }
}

func fetchForcast(cityId: Int, completion: @escaping (Result<Forcast, Error>) -> ()) {
    let urlStr =
    "http://api.openweathermap.org/data/2.5/forcast?id=\(cityId)&appid=9cda367698143794391817f65f81c76e&units=metric&lang=kr"
    
    fetch(urlStr: urlStr, completion: completion)
}


fetchForcast(cityId: 1839652) { (result) in
    switch result {
    case .success(let forcast):
        dump(forcast)
    case .failure(let error):
        print(error)
    }
}

func fetchForcast(location: CLLocation, completion: @escaping (Result<Forcast, Error>) -> ()) {
    let urlStr =
        "http://api.openweathermap.org/data/2.5/forcast?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=9cda367698143794391817f65f81c76e&units=metric&lang=kr"
    fetch(urlStr: urlStr, completion: completion)
}


let location = CLLocation(latitude: 37.1498, longitude: 127.0772)
fetchForcast(location: location) { (result) in
    switch result {
    case .success(let forcast):
        dump(forcast)
    case .failure(let error):
        print(error)
    }
}
