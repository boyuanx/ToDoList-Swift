//
//  NewTodoViewController.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/23/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import UIKit
import SnapKit

class NewTodoViewController: UIViewController {
    
    let nameLabel: UILabel = {
        let l = UILabel()
        l.textColor = .label
        return l
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .label
        tf.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 5
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension NewTodoViewController {
    
    func initUI() {
        title = "Create Post"
        
    }
    
}
