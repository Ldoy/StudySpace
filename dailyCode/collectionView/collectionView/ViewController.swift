//
//  ViewController.swift
//  collectionView
//
//  Created by Do Yi Lee on 2021/08/16.
//

import UIKit

class ViewController: UIViewController {
    
    var nsCache = NSCache<AnyObject, AnyObject>()
    var image = [Image]() // 이미지 저장할라고 ,
    
    //Step3
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //step8
        
        // step11
        NetworkingService.shared.getImages { reponse in
            print(reponse.image)
            DispatchQueue.main.async {
                self.image = reponse.image
                self.collectionView.reloadData()
                //이건 뭐임?

            }

        }
    }
}

//step4 : numberOfItemsInSection, cellForItemAt, dequeue
// step5 : 아웃렛 연결 
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? ImageCell else { return UICollectionViewCell()
        }
        cell.configure(with: image[indexPath.item])
        return cell
    }
    
    
}



extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize() }
        var bounds = collectionView.bounds
        var width = bounds.width - (layout.sectionInset.left + layout.sectionInset.right)
        width = (width - (layout.minimumInteritemSpacing * 2)) / 3
        var height = bounds.height - (layout.sectionInset.top + layout.sectionInset.bottom)
        height = (height - (layout.minimumLineSpacing * 2)) / 3
        return CGSize(width: width, height: height)
    }
}
