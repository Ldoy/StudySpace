//
//  ViewController.swift
//  Async_AwaitExercise
//
//  Created by Do Yi Lee on 2021/10/03.
//

import UIKit

class ViewController: UIViewController, URLSessionDataDelegate {
    let networkManager = NetworkManager()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func request(_ sender: Any) {
        networkManager.request(URLSession(configuration: .default))
        print("request")
    }
  
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        let image = UIImage(data: data)
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.backgroundColor = .blue
    }


}

