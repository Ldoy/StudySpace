//
//  ViewController.swift
//  Currency(Exercise_20210123)
//
//  Created by Do Yi Lee on 2021/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var convertResult: UILabel!
    
    @IBOutlet weak var convertRate: UITextField!
    
    @IBOutlet weak var convertAmount: UITextField!
    
    @IBOutlet weak var convertState: UISegmentedControl!
    
    @IBOutlet weak var convertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        convertResult.text = ""
    }
    
    @IBAction func convertClick(_ sender: Any) {
        
        let rate = Float(convertRate.text!)!
        let amount = Float(convertAmount.text!)!
        
        let result = rate * amount
        
        if convertState.selectedSegmentIndex == 0 {
            convertResult.text = " ￦ \(result) "
        }else {
            convertResult.text = "﹩\(result) "
        }
        
        
    }
    
    

}

