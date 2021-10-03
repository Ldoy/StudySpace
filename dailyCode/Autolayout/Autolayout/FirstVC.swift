//
//  FirstVC.swift
//  Autolayout
//
//  Created by Do Yi Lee on 2021/09/01.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        button.setTitle("코드로버튼만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        // 바텀
        let buttonBottomToSafeArea = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        buttonBottomToSafeArea.priority = .defaultLow
        
        let buttonBottomToSuperView = button.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor, constant: -20)
        buttonBottomToSuperView.priority = .defaultHigh
        print(buttonBottomToSafeArea.priority, buttonBottomToSuperView.priority)
        buttonBottomToSuperView.isActive = true
        buttonBottomToSafeArea.isActive = true
        
        
    }
    

    
}
