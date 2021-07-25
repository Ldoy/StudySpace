//
//  DetailViewController.swift
//  DataTransfer_Delegation
//
//  Created by Do Yi Lee on 2021/07/24.
//

import UIKit

class DetailViewController: UIViewController {
    var list: TodoListItems?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var codingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = list?.title
    }

    func configure(list: TodoListItems) {
        self.list = list
    }
}
