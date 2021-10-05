//
//  CookBook_v2_ViewController.swift
//  Autolayout
//
//  Created by Do Yi Lee on 2021/10/05.
//

import UIKit

class CookBook_v2_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let topLabel = UILabel()
        topLabel.largeContentTitle = "Flowers"
        topLabel.textColor = .black
        topLabel.textAlignment = .center
        
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.blue, for: .normal)
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat")!
        
        let stack = UIStackView(arrangedSubviews: [topLabel, button, imageView])
        stack.frame = view.bounds
        stack.alignment = .center
        stack.distribution = .equalSpacing
        self.view.addSubview(stack)
        
    }
    


}
