//
//  ViewController.swift
//  DataTransfer_Delegation
//
//  Created by Do Yi Lee on 2021/07/23.
//

import UIKit

class ViewController: UIViewController {
    var list = TodoListSections.generateData()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //인터페이스로 델리게이트, 데이터 소스 설정
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailVC",
           let detailVC = segue.destination as? DetailViewController,
           let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let todolistItems = list[indexPath.section].items[indexPath.row]
            detailVC.configure(list: todolistItems)
           }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let target = list[indexPath.section].items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath)
        
        cell.textLabel?.text = target.title
        cell.imageView?.image = UIImage(named: target.imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].headers
    }
    
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "goToDetailVC", let cell = sender as? UITableViewCell, let destinationVC = segue.destination as? DetailViewController {
    //            destinationVC.codingImage = cell.imageView
    //        }
    //    }
}


//
//enum ImageName: String {
//    case 코딩1, 코딩2, 코딩3, 기본1
//}
//
//extension UIImage {
//        convenience init(named imageName: ImageName) {
//            self.init(named: imageName.rawValue)!
//        }
//}
