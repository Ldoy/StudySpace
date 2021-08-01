//
//  EnglishDetailViewController.swift
//  DataTransfer_Delegation
//
//  Created by Do Yi Lee on 2021/07/24.
//

import UIKit

class EnglishDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ClosureViewController else {
            return
        }
        
        vc.completionHandler = { text in print("test = \(text)")
            return text.count
        }
        
    }
   

}
