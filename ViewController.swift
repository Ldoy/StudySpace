//
//  ViewController.swift
//  1
//
//  Created by Do Yi Lee on 2021/01/21.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func responseToButton(_ sender: Any) {
        mainLabel.textColor = .white
        mainLabel.text = "Well, I like Swift!!"
        view.backgroundColor = .black
        
    }
    
    
}

