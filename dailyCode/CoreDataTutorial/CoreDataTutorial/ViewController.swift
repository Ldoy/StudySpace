//
//  ViewController.swift
//  CoreDataTutorial
//
//  Created by Do Yi Lee on 2021/09/11.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let tableview = UITableView()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //persistent와 nsobcontext에접근하는방법.
        // 앱 델리게이트의 속성에 접근
        
        //MARK:- UI요소
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //  self.navigationController?.navigationItem.rightBarButtonItem =
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

        tableview.delegate = self
        tableview.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableview.frame = view.bounds
        view.addSubview(tableview)
    }
    
    func fetchPeople() {
        do {
            self.items = try context.fetch(Person.fetchRequest())
            // 메인스레드에서 하지 않는 경우가 있기 때문
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        } catch {
            print(" fetch 에러 ")
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 이게 있어야 첫 화면에 코어데이터에 저장된 것 나옴
        // self.fetchPeople()
        
        return items?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        let person = self.items?[indexPath.row]
        
        cell.textLabel?.text = person?.name
        return cell
    }

    // 없애는 메소드
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, compltionHandler in
            // 누굴 없앨지
            let personToRemove = self.items?[indexPath.row]
            
            //실제 없애자
            self.context.delete(personToRemove!)
            
            //없앤 상태를 저장
            do {
                try self.context.save()
            } catch {
                print("")
            }
            
            //refetch
            self.fetchPeople()
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let person = self.items?[indexPath.row]
        
        let alert = UIAlertController(title: "Edit Person", message: "Edit name:", preferredStyle: .alert)
        alert.addTextField()
        
        //pre-loading 해줌
        let textfield = alert.textFields![0]
        textfield.text = person?.name
        
        let saveButton = UIAlertAction(title: "save", style: .default) { (action) in
            let textfield = alert.textFields![0]
            
            //이름 바꾸기
            person?.name = textfield.text
            
            // 저장
            do {
                try self.context.save()
            } catch {
                
            }
            // re-fetch
            self.fetchPeople()
        }
    }
}

extension ViewController {
    @objc func addTapped() {
        let alert = UIAlertController(title: "edit person",
                                      message: "person수정",
                                      preferredStyle: .alert)
        alert.addTextField()
        let submitButton = UIAlertAction(title: "add", style: .default) { (action) in
            let textField = alert.textFields![0]
            
            //Create a person object
            let newPerson = Person(context: self.context)
            newPerson.name = textField.text
            newPerson.age = 20
            newPerson.gender = "Male"
            
            //save Data
            do {
                try self.context.save()
            } catch {
                print("saveData Error")
            }
            
            //re-fetch the data
            self.fetchPeople()
        }   
        alert.addAction(submitButton)
        present(alert, animated: true)
    }
    
//    func saveSpotsLocation(model: String, packageId: String, regionName: String) {
//      let newUser = NSEntityDescription.insertNewObject(forEntityName: "SpotsDetail", into: context)
//      do {
//        let data = NSKeyedArchiver.archivedData(withRootObject: model.dictionaryRepresentation())
//        newUser.setValue(data, forKey: "data")
//        newUser.setValue(packageId, forKey: "packageId")
//        newUser.setValue(regionName, forKey: "regionName")
//        try context.save()
//      } catch {
//        print("failure")
//      }
//    }
}
