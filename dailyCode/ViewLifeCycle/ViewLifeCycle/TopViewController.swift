//
//  TopViewController.swift
//  ViewLifeCycle
//
//  Created by Do Yi Lee on 2021/07/23.
//

import UIKit

class TopViewController: UIViewController {


    override func loadView() {
        super.loadView()
        print("#1ChildVC", #function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("#2ChildVC", #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("#3ChildVC", #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("#4ChildVC", #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("#5ChildVC", #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("#6ChildVC", #function)
    }
}
