//
//  NextViewController.swift
//  ViewLifeCycle
//
//  Created by Do Yi Lee on 2021/07/23.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var childView: UIView!
    
    
    
    override func loadView() {
        super.loadView()
        print("#1NextVC", #function)
    }
    
    @objc func deleteChild() {
        for vc in children {
                vc.view.removeFromSuperview() // 해당 뷰컨이 reponder 체인에서 제거
                vc.willMove(toParent: self)
                vc.removeFromParent() // parent 뷰에서 제거
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("#2NextVC", #function)
        if let topVC = storyboard?.instantiateViewController(identifier: "topVC") {
            self.addChild(topVC)
            topVC.didMove(toParent: self)
            childView.bounds = topVC.view.frame
            childView.addSubview(topVC.view)
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteChild))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("#3NextVC", #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("#4NextVC", #function)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("#5NextVC", #function)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("#6NextVC", #function)
    }
}
