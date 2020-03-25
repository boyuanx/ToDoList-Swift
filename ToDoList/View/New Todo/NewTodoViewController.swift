//
//  NewTodoViewController.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/23/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import UIKit
import SnapKit
import UITextView_Placeholder

class NewTodoViewController: UIViewController {
    
    let nameLabel: UILabel = {
        let l = UILabel()
        l.textColor = .label
        l.text = "Name"
        return l
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .label
        tf.layer.borderColor = UIColor.label.cgColor
        tf.layer.borderWidth = 0.2
        tf.layer.cornerRadius = 5
        tf.placeholder = "What is your name?"
        tf.setLeftPaddingPoints(5)
        tf.setRightPaddingPoints(5)
        return tf
    }()
    
    let nameStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillProportionally
        return sv
    }()
    
    let contentTextView: UITextView = {
        let tv = UITextView()
        tv.textColor = .label
        tv.placeholder = "What would you like to say?"
        tv.placeholderColor = .tertiaryLabel
        tv.layer.borderColor = UIColor.label.cgColor
        tv.layer.borderWidth = 0.2
        tv.layer.cornerRadius = 5
        return tv
    }()
    
    let datePicker: UIDatePicker = {
        let p = UIDatePicker()
        p.minimumDate = Date()
        p.datePickerMode = .dateAndTime
        return p
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillProportionally
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: CGFloat(5), initialSpringVelocity: CGFloat(50), options: .curveEaseInOut, animations: {
            [weak self] in
            self?.nameStackView.spacing = 10
            self?.stackView.spacing = 20
        }, completion: nil)
    }
    
    @objc func savePost() {
        guard let name = nameTextField.text, !contentTextView.text.isEmpty else {
            showAlert(title: "Warning", message: "Please fill out all the fields!", actionMessage: "Okay, I'll do that.")
            return
        }
        let newPost = Post(name: name, content: contentTextView.text, date: datePicker.date, documentId: "")
        FirebaseService.shared.createPost(newPost) { [weak self] (error) in
            if let error = error {
                self?.showAlert(title: "Error creating new post", message: error.localizedDescription, actionMessage: "Let me try again.")
                return
            }
            self?.navigationController?.popViewController(animated: true)
        }
    }

}

extension NewTodoViewController {
    
    func initUI() {
        title = "Create Post"
        view.backgroundColor = .systemBackground
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePost)), animated: false)
    }
    
    func initLayout() {
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(nameStackView)
        stackView.addArrangedSubview(contentTextView)
        stackView.addArrangedSubview(datePicker)
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (this) in
            this.top.equalTo(view.snp.topMargin).offset(20)
            this.bottom.equalTo(view.snp.bottomMargin)
            this.leading.equalToSuperview().offset(20)
            this.trailing.equalToSuperview().offset(-20)
        }
        nameLabel.snp.makeConstraints { (this) in
            this.width.lessThanOrEqualTo(50)
        }
        contentTextView.snp.makeConstraints { (this) in
            this.height.greaterThanOrEqualTo(100)
        }
    }
    
    func showAlert(title: String, message: String, actionMessage: String) {
        let alert = UIAlertController()
        alert.title = title
        alert.message = message
        alert.addAction(UIAlertAction(title: actionMessage, style: .default, handler: { [weak self] (action) in
            self?.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    
}

// Content insets for UITextField
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
