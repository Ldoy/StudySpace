//
//  DynamicStackViewController.swift
//  Autolayout
//
//  Created by Do Yi Lee on 2021/10/07.
//

import UIKit

class DynamicStackViewController: UIViewController {
    private var vertical = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. 스택 뷰 두개 만들기
        
        //let vertical = UIStackView()
        vertical.axis = .vertical
        vertical.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(vertical)
        
        let horizontal = UIStackView()
        horizontal.axis = .horizontal
        horizontal.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(horizontal)
        
        let removeButton = UIButton()
        removeButton.setTitle("삭제", for: .normal)
        removeButton.setTitleColor(.black, for: .normal)
        removeButton.addTarget(self, action: #selector(removeView), for: .touchUpInside)
        
        
        let addButton = UIButton()
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.systemPink, for: .normal)
        addButton.addTarget(self, action: #selector(addView), for: .touchUpInside)
        
        
        
        horizontal.addArrangedSubview(addButton)
        horizontal.addArrangedSubview(removeButton)
        
        horizontal.distribution = .fillEqually
        horizontal.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        horizontal.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        horizontal.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        vertical.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        vertical.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        vertical.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        vertical.bottomAnchor.constraint(equalTo: horizontal.topAnchor).isActive = true
        
        vertical.spacing = 10
        vertical.distribution = .fillEqually
        
    }
    
    @objc func addView() {
        let addedView = UIView()
        addedView.backgroundColor = .blue
        //1.
        addedView.isHidden = true
        self.vertical.addArrangedSubview(addedView)
        //애니메이션 적용하기
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn]) {
            addedView.isHidden = false

        } completion: {_ in
            print("에니메이션이 끝났습니다")
        }
 
    }

    @objc func removeView() {
        guard let removedView = self.vertical.arrangedSubviews.last else {
            return
        }
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn]) {
            
                        removedView.isHidden = true

            //self.vertical.removeArrangedSubview(removedView)


        } completion: {_ in
            self.vertical.removeArrangedSubview(removedView)
        }
    }
}
