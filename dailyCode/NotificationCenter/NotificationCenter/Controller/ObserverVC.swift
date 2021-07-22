//
//  NotiVC.swift
//  NotificationCenter
//
//  Created by Do Yi Lee on 2021/07/22.
//

import UIKit

class ObserverVC: UIViewController {
    @IBOutlet weak var valueLabel: UILabel!
    
    @objc func process(noti: Notification) {
        guard let value = noti.userInfo?["NewValue"] as? String else {
            return
        }
        
        valueLabel.text = value
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(process), name: NSNotification.Name.NewValueDidInput, object: nil)
    }
  

}
