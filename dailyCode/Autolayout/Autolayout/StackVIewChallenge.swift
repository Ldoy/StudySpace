//
//  StackVIewChallenge.swift
//  Autolayout
//
//  Created by Do Yi Lee on 2021/10/05.
//

import UIKit

class StackVIewChallenge: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.restorationIdentifier = "next"
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat")!
        
        let firstLabel = UILabel()
        firstLabel.text = "first"
        firstLabel.textColor = .black
        firstLabel.backgroundColor = .gray
        firstLabel.textAlignment = .left
        
        let middleLabel = UILabel()
        middleLabel.text = "middle"
        middleLabel.textColor = .black
        middleLabel.backgroundColor = .gray
        middleLabel.textAlignment = .left
        
        let lastLabel = UILabel()
        lastLabel.text = "last"
        lastLabel.textColor = .black
        lastLabel.backgroundColor = .gray
        lastLabel.textAlignment = .left
        
        let textField = UITextField()
        textField.backgroundColor = .systemGray
        
        let topRightStack = UIStackView(arrangedSubviews: [firstLabel, middleLabel, lastLabel])
        self.view.addSubview(topRightStack)
        topRightStack.translatesAutoresizingMaskIntoConstraints = false
        
        topRightStack.spacing = 8
        topRightStack.axis = .vertical
        topRightStack.alignment = .fill
        topRightStack.distribution = .fillProportionally
        
        let topStack = UIStackView(arrangedSubviews: [imageView, topRightStack])
        self.view.addSubview(topStack)
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.axis = .horizontal
        topStack.spacing = 8
        topStack.alignment = .fill
        topStack.distribution = .fill
        
        let wholeStack = UIStackView(arrangedSubviews: [topStack, textField])
        self.view.addSubview(wholeStack)
//        wholeStack.alignment = .fill
//        wholeStack.distribution = .fillProportionally
        wholeStack.translatesAutoresizingMaskIntoConstraints = false
        wholeStack.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        wholeStack.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        wholeStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        wholeStack.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        wholeStack.axis = .vertical
        wholeStack.alignment = .fill
        wholeStack.distribution = .fill
        wholeStack.spacing = 8
        imageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
    }
    


}
