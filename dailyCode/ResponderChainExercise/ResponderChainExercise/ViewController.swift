//
//  ViewController.swift
//  ResponderChainExercise
//
//  Created by Do Yi Lee on 2021/09/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var greenView: GreenView!
    @IBAction func buttonClick(_ sender: Any) {
        print("버튼1")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
    }
    
    @objc private func gestureRecognized(_ recognizer: UITapGestureRecognizer) {
        print("Gesture Recognizer 인식")
    }
    
    @objc private func buttonTapped(_ button: UIButton) {
        print("버튼 인식")
    }
    
}

