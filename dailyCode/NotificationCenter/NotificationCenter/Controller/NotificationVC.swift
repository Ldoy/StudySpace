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
        // 디폴트 속성으로 기본 제공 기능이용가능 -> 전달할 때는 포스트 사용 , 유저인포를 받는 메소드를 선택하기,
//        NotificationCenter.default.post(name: <#T##NSNotification.Name#>, object: <#T##Any?#>, userInfo: <#T##[AnyHashable : Any]?#>)
        //  노티피케이션 전달하는 객체 구분할 때는 옵젝트 파라미터 이용
        // 유저인포 : 개수의 상관없이 항상 구현해야함. 그래서 두번째 파라미터를 대신 활용하기도 함?
        NotificationCenter.default.post(name: NSNotification.Name.NewValueDidInput, object: nil, userInfo: ["NewValue" : text])
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
