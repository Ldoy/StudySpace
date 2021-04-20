import UIKit
import CoreLocation // 뭥미?

var str = "Hello, playground"

//파싱???
//json과 동일한 구조체를 만들어야함

struct CurrentWeather: Codable {
    // 구조체의 이름은 api key 와 동일하게, 형식 동일하게 선언해야 함(선택적으로 선언 가능)
    
    let dt: Int // json에서  단일값을 가지면 ( "dt": 1618916390) 바로 선언 가능
    
    //nested type으로 선언.
    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String

    }
    
    //속성과 json키의 이름 동일하게
    let weather: [Weather]
    
    //필요한 값만 가지고 와도 됨
    struct Main: Codable {
        let temp: Double
        let temp_min : Int
        let temp_max :Int
    }
    
    let main : Main

}

enum ApiError: Error {
    case unowned
    case invalidUrl(String)
    case invalidResponse
    case failed(Int)
    case emptyData
}

// <ParsingType: Codable> 제네릭 함수로 바꿈, 클로져 전달하는 파라미터 추가(completion) 결과를 받을 때는 result타입으로 받음
func fetch<ParsingType: Codable>(urlStr: String, completion: @escaping (Result<ParsingType, Error>) -> ()) {
    guard let url = URL(string: urlStr) else {
        //fatalError("URL생성실패")
        // 오류처리 대신 else에서 코드가 멈추고 에러 메세지가 출력됨. 단 크래쉬가 바로 발생하기 때문에 절대 앱스토어에 같이 쓰면 안됨
        completion(.failure(ApiError.invalidUrl(urlStr)))
        return
    }
    
    //네트워크 요청
   
    let task = URLSession.shared.dataTask(with: url) // The URLSession provide an API for downloading data from and uploading data to endpoints indicated by URLs. 아래 콜로저는 dataTask의 completionHandler
        {
        (data, response, error) in
        if let error = error {
            //fatalError(error.localizedDescription)
            completion(.failure(error))
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            //fatalError("invaild response")
            //The HTTPURLResponse class is a subclass of URLResponse that provides methods for accessing information specific to HTTP protocol responses.
            
            completion(.failure(ApiError.invalidResponse))// 에러형식이 필요하기 때문에 enum apiError선언
        return
        }
        
        //타입캐스팅 성공 후 상태코드 확인
        guard httpResponse.statusCode == 200 else {
            //fatalError("failed code \(httpResponse.statusCode)")
            completion(.failure(ApiError.failed(httpResponse.statusCode)))
            return
        }
        
        //컴플리션핸들러가 옵셔널이기 때문에 guard사용
        guard let data = data else {
            completion(.failure(ApiError.emptyData))
            return
            //fatalError("empty data")
        }
        
        //json 디코더 만들기
        do {
            let decoder = JSONDecoder()
            
            // 파싱 형식이 첫번째 파라미터, json이 들어가있는 데이터가 두번째 파라미터,
            let data = try decoder.decode(ParsingType.self, from: data)
            
            completion(.success(data))
            
//            // 디스크립션 키에 날씨가 저장되어있음 -> 값을 가져올 땐 웨더키에 접근해서              배열의 첫번째접근하는 것처럼 동일하게 진행!
//            weather.weather.first?.description
//
//            //나의 시도 : 현재 온도 가져오기
//            weather.main.temp
//
            

        } catch {
            //print(error)
            //fatalError(error.localizedDescription)
            completion(.failure(error))
        }
        
        
    }
    // 네트워크 요청 -> task의 클로져가 호출됨
    task.resume()
}

func fetchCurrentWeather(cityName: String, completion: @escaping (Result<CurrentWeather, Error>) -> ()) {
    let urlStr =
    "http://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=9cda367698143794391817f65f81c76e&units=metric&lang=kr"
    // http://꼭 붙이기
    
    fetch(urlStr: urlStr, completion: completion)
}
fetchCurrentWeather(cityName: "osan") {_ in}

//도시의 아이디
func fetchCurrentWeather(cityId: Int, completion: @escaping (Result<CurrentWeather, Error>) -> ()) {
    let urlStr =
    "http://api.openweathermap.org/data/2.5/weather?id=\(cityId)&appid=9cda367698143794391817f65f81c76e&units=metric&lang=kr"
    
    fetch(urlStr: urlStr, completion: completion)
}


fetchCurrentWeather(cityId: 1839652) { (result) in
    switch result {
    case .success(let weather):
        dump(weather)
    case .failure(let error):
        print(error)
    }
}


func fetchCurrentWeather(location: CLLocation, completion: @escaping (Result<CurrentWeather, Error>) -> ()) {
    let urlStr =
        "http://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=9cda367698143794391817f65f81c76e&units=metric&lang=kr" // 뭥미?
    
    fetch(urlStr: urlStr, completion: completion)
}


let location = CLLocation(latitude: 37.1498, longitude: 127.0772)
fetchCurrentWeather(location: location) { (result) in
    switch result {
    case .success(let weather):
        dump(weather)
    case .failure(let error):
        print(error)
    }
}
//함수의 파라미터로 넣을 로케이션 인스턴스를 생성
// CLLocation?

