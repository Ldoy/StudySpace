//
//  Image.swift
//  collectionView
//
//  Created by Do Yi Lee on 2021/08/16.
//

import Foundation
import UIKit

//step8 : Iamge
struct Image {
    // 밖에서 접근 못하도록
    private let link: String
    private let id: String
    
    //타이틀만 접근하도록 함
    let title: String
    
    init?(json: [String: Any]) {
        guard let id = json["id"] as? String,
              let title = json["title"] as? String,
              let link = json["link"] as? String else { return nil }
        
        self.link = link
        self.id = id
        self.title = title
    }
    
    //step15 - 다운로드 받은 이미지를(link) 전달
    func showImage(completion: @escaping (UIImage) -> ()) {
        if let image = imageCache.bringCachedImage(forkey: id) {
            completion(image)
        } else {
        NetworkingService.shared.downloadImage(from: link) { image in
            //step18

            imageCache.add(image, forkey: self.id)
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
