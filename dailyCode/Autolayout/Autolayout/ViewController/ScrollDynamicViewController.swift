//
//  ScrollDynamicViewController.swift
//  Autolayout
//
//  Created by Do Yi Lee on 2021/10/07.
//

import UIKit

class ScrollDynamicViewController: UIViewController {
    @IBOutlet weak var vertical: UIStackView!
    
    @IBAction func addView() {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.isHidden = true
        label.text = """
                asdfa
            asdfasdfa
            sasdf
            asdfasdf
            asdf
            """
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        self.vertical.addArrangedSubview(label)
        //애니메이션 적용하기
        UIView.animate(withDuration: 0.3, delay: 0) {
            label.isHidden = false
        }
        
    }
    
    @IBAction func removeView() {
        guard let removedView = self.vertical.arrangedSubviews.last else {
            return
        }
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn]) {
            
            removedView.isHidden = true
        } completion: {_ in
            self.vertical.removeArrangedSubview(removedView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
