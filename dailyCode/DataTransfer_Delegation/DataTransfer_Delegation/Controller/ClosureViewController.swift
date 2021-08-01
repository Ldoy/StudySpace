//
//  ClosureViewController.swift
//  DataTransfer_Delegation
//
//  Created by Do Yi Lee on 2021/08/01.
//

import UIKit

class ClosureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    var completionHandler: ((String) -> (Int))?

    @IBAction func closureButton(_ sender: Any) {
        let result = completionHandler?("closure!")
        //result에 Int? 타입의 결과가 assign
        
        print("컴플리션핸들러가 돌아왔어요\(result ?? 0)")
    }
}
