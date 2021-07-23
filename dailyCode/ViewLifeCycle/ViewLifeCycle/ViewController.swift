//
//  ViewController.swift
//  ViewLifeCycle
//
//  Created by Do Yi Lee on 2021/07/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var goToNextVC: UIButton!

    override func loadView() {
        super.loadView()
        print("#1", #function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("#2", #function)
        goToNextVC.addTarget(self, action: #selector(goToNextVCButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("#3", #function)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("#4", #function)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("#5", #function)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("#6", #function)

    }
    
    @objc func goToNextVCButton() {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "nextVC") else {
            return
        }
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

