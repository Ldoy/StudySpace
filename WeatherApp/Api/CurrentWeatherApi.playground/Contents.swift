import UIKit

var str = "Hello, playground"

//파싱???
//json과 동일한 구조체를 만들어야함

struct CurrentWeather: Codable {
    // 구조체의 이름은 api key 와 동일하게, 형식 동일하게 선언해야 함(선택적으로 선언 가능)
    
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

func fetchCurrentWeather(cityName: String) {
    let urlStr =
    "http://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=9cda367698143794391817f65f81c76e&units=metric&lang=kr"
    
    guard let url = URL(string: urlStr) else {
        fatalError("URL생성실패")
        // 오류처리 대신 else에서 코드가 멈추고 에러 메세지가 출력됨. 단 크래쉬가 바로 발생하기 때문에 절대 앱스토어에 같이 쓰면 안됨
    }
    
    let task = URLSession.shared.dataTask(with: url) {
        (data, response, error) in
        if let error = error {
            fatalError(error.localizedDescription)
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            fatalError("invaild response")
        }
        
        guard httpResponse.statusCode == 200 else {
            fatalError("failed code \(httpResponse.statusCode)")
        }
        
        guard let data = data else {
            fatalError("empty data")
        }
        
        do {
            let decoder = JSONDecoder()
            let weather = try decoder.decode(CurrentWeather.self, from: data)
            
            weather.weather.first?.description
            weather.main.temp
        } catch {
            print(error)
            fatalError(error.localizedDescription)
        }
        
        
    }
    // 네트워크 요청
    task.resume()
    
}

fetchCurrentWeather(cityName: "osan")
