//
//  SecondVC.swift
//  Autolayout
//
//  Created by Do Yi Lee on 2021/09/01.
//

import UIKit

class SecondVC: UIViewController {
let cat = UIImage(named: "cat")
    
    @IBOutlet weak var catTextView: UITextView!
    @IBOutlet weak var catLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = cat!
        cat?.alignmentRectInsets
        catLabel.text = "고양이"
        catTextView.font = UIFont.preferredFont(forTextStyle: .body)
        catTextView.adjustsFontForContentSizeCategory = true
        // 오 적용됨
        
    }
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewWillLayoutSubviews() {
        let size = view.bounds.size
        let useWideDesign = size.width >= size.height
        
        if useWideDesign {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate { _ in
            self.stackView.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.stackView.transform = CGAffineTransform.identity
            }
        }

    }

}
