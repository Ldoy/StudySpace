//
//  GetImageResponse.swift
//  collectionView
//
//  Created by Do Yi Lee on 2021/08/16.
//

import Foundation

//step7
struct GetImageResponse {
    
    let image: [Image]
    
    init(json: [String: Any]) throws {
        print(json)
        //step9
        
        guard let data = json["data"] as? [[String: Any]] else { throw MyError.someError }
       
        // image로 바꾸기
        let image = data.map { Image(json: $0) }.flatMap { $0 }
        self.image = image
    }
}
