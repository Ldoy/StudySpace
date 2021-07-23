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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("#2NextVC", #function)
      
        self.addChild(childView)
        self.view.addSubview(childView)
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
