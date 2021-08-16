//
//  ImageCell.swift
//  collectionView
//
//  Created by Do Yi Lee on 2021/08/16.
//

import UIKit

class ImageCell: UICollectionViewCell {
    //step2
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    
    //의존성 주입 step12, init같은아이
    func configure(with image: Image) {
        self.titleLabel.text = image.title
        //step16
        image.showImage { image in
            self.titleImage.image = image
        }
    }
    
    override func prepareForReuse() {
        titleImage.image = nil
        titleLabel.text = nil
    }
 
}
