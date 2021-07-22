//
//  TableViewController.swift
//  NotificationCenter
//
//  Created by Do Yi Lee on 2021/07/22.
//

import UIKit

extension NSNotification.Name {
    // 노티피케이션 접미어를 가진 세로운 이름 생성NewValue
    static let NewValueDidInput = NSNotification.Name("NewValueDidInputNotification")
}

class NotificationVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBAction func postToNotiCenter(_ sender: Any) {
        guard let text = textField.text else { return }
     
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
    }
    
    override func viewWillDisappear (_ animated: Bool) {
        super.viewWillDisappear(animated)
        textField.resignFirstResponder()
    }

}
