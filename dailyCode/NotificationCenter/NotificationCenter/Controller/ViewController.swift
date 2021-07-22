//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Do Yi Lee on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    let list = ["test"]
    
//    @objc func process(noti: Notification) {
//        guard let value = noti.userInfo?["NewValue"] as? String else {
//            return
//        }
//        valueLabel.text = value
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // 특정 개체와 메소드를 옵저버로 등록하기
        // 뷰컨이 옵저버로 지정됨, 두번째는 어떤걸 실행할지
        // 세번째 옵저버가 처리한 노티 이름
        // 네번째 : 센더를 제한할 때 - 만약 포스트할 때 센더를 표시했으면 지금 코드에서 그 노티를 받고싶은 경우 해당 옵젝을 표현해야함. 지금은 nil
//        NotificationCenter.default.addObserver(self, selector: #selector(process(noti:)), name: NSNotification.Name.NewValueDidInput, object: nil)
//
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
    
    
}
