//
//  FirstVC.swift
//  Autolayout
//
//  Created by Do Yi Lee on 2021/09/01.
//

import UIKit

class FirstVC: UIViewController {
    
   @objc func goToNext() {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "next") as? StackVIewChallenge
        else {
            return
        }
        
        show(nextVC, sender: self)

    }
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topLabel = UILabel()
        topLabel.text = "Flowers"
        topLabel.textColor = .black
        topLabel.textAlignment = .center
        
        button.setTitle("Edit", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.black, for: .normal)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat")!
        
        let stack = UIStackView(arrangedSubviews: [topLabel, imageView, button])
        self.view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        //        stack.bounds = view.safeAreaLayoutGuide.layoutFrame
        
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 20
        imageView.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        
        button.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        
        //        let button = UIButton()
        //        button.setTitle("코드로버튼만들기", for: .normal)
        //        button.setTitleColor(.black, for: .normal)
        //        button.backgroundColor = .systemBlue
        //        self.view.addSubview(button)
        //
        //        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        //        button.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        //        // 바텀
        //        let buttonBottomToSafeArea = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        //        buttonBottomToSafeArea.priority = .defaultLow
        //
        //        let buttonBottomToSuperView = button.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor, constant: -20)
        //        buttonBottomToSuperView.priority = .defaultHigh
        //        print(buttonBottomToSafeArea.priority, buttonBottomToSuperView.priority)
        //        buttonBottomToSuperView.isActive = true
        //        buttonBottomToSafeArea.isActive = true
        //
        //
        //        let button2 = UIButton()
        //        button2.setTitle("제약으로 버튼만들기", for: .normal)
        //        button2.setTitleColor(.black, for: .normal)
        //        button2.backgroundColor = .systemBlue
        //        self.view.addSubview(button2)
        //
        //        button2.translatesAutoresizingMaskIntoConstraints = false
        //
        //        let safeArea = self.view.safeAreaLayoutGuide
        //        let leading = NSLayoutConstraint(item: button2,
        //                                         attribute: .leading,
        //                                         relatedBy: .equal,
        //                                         toItem: safeArea,
        //                                         attribute: .leading,
        //                                         multiplier: 1,
        //                                         constant: 16)
        //
        //        let trailing = NSLayoutConstraint(item: button2,
        //                                          attribute: .trailing,
        //                                          relatedBy: .equal,
        //                                          toItem: safeArea,
        //                                          attribute: .trailing,
        //                                          multiplier: 1,
        //                                          constant: -16)
        //
        //        let top = NSLayoutConstraint(item: button2,
        //                                     attribute: .top,
        //                                     relatedBy: .equal,
        //                                     toItem: safeArea,
        //                                     attribute: .top,
        //                                     multiplier: 1,
        //                                     constant: 0)
        //
        //
        //        let topView = NSLayoutConstraint(item: button2,
        //                                         attribute: .top,
        //                                         relatedBy: .lessThanOrEqual,
        //                                         toItem: safeArea,
        //                                         attribute: .top,
        //                                         multiplier: 1,
        //                                         constant: 50)
        //        NSLayoutConstraint.activate([leading, trailing, topView, top])
        //
        //        topView.priority = .defaultHigh
        //        top.priority = .defaultLow
    }
    
    
    
}
