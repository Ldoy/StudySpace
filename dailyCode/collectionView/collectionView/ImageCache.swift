//
//  ImageCache.swift
//  collectionView
//
//  Created by Do Yi Lee on 2021/08/16.
//

import UIKit

let imageCache = ImageCache()

//step17
class ImageCache: NSCache<AnyObject, AnyObject> {
    
    //이미지캐시에 이미지 추가하는 메서드
    func add(_ image: UIImage, forkey key: String) {
        setObject(image, forKey: key as NSString)
    }
    
    // 확인하는 메서드
    func bringCachedImage(forkey key: String) -> UIImage {
        guard let cachedImage = object(forKey: key as NSString) as? UIImage else { return UIImage() }
        return cachedImage
    }
    
}
