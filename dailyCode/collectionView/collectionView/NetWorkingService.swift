//
//  NetWorkingService.swift
//  collectionView
//
//  Created by Do Yi Lee on 2021/08/16.
//

import UIKit

//step6

class NetworkingService {
    // 싱글턴으로 만들기
    static let shared = NetworkingService()
    private init() {}
    
    let session = URLSession.shared
    
    //에러핸들링은 안할거임
    func getImages(success successBlock: @escaping (GetImageResponse) -> ()) {
        //step7, imgurapi 가져옴 
        guard let url = URL(string: "https://api.imgur.com/3/gallery/r/cats") else { return }
        
        var request = URLRequest(url: url)
        request.addValue("Client-ID f02304f19642d6d", forHTTPHeaderField: "Authorization")
        session.dataTask(with: request) { data, error, response in
//            if error == nil {
//                print(error)
//            } else { return }
            
            if let response = response as? HTTPURLResponse {
//                print(response.statusCode)
            } 
            
            guard let data = data else { return }
            do {
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                
                // json잘 들어왔는지 확인하기
                print(json)
                let getImageResponse = try GetImageResponse(json: json)
                successBlock(getImageResponse)
            } catch {
                // 아무것도 안함
                print("hety")
            }
        }.resume()
    }
    
    //step14
    func downloadImage(from link: String, success successBlock: @escaping (UIImage) -> ()) {
        guard let url = URL(string: link) else { return }
        session.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let downloadImage = UIImage(data: data)
            else { return }
            successBlock(downloadImage)
        }.resume()
        
    }
    
}
