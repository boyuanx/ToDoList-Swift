//
//  ToDoCollectionViewCell.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/12/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import UIKit
import YogaKit

class ToDoCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel = UILabel()
    private let deleteButton = UIButton()
    weak var delegate: ToDoCellDeleteDelegate?
    var currentModel: Model!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initLayout()
    }
    
    func setLabelText(text: String) {
        titleLabel.text = text
    }
    
    func getLabelText() -> String {
        return titleLabel.text ?? "nil"
    }
    
    @objc func deleteData() {
        delegate?.delete(model: currentModel)
    }
    
}

// MARK: - Basic UI
extension ToDoCollectionViewCell {
        
    func initUI() {
        titleLabel.textColor = .black
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteData), for: .touchUpInside)
        deleteButton.backgroundColor = .systemRed
        deleteButton.layer.cornerRadius = 5
        deleteButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        contentView.addSubview(titleLabel)
        contentView.addSubview(deleteButton)
    }
    
    func initLayout() {
        contentView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexDirection = .row
        }
        titleLabel.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginStart = 10
            layout.flexGrow = 1
        }
        deleteButton.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginHorizontal = 5
            layout.marginVertical = 7
        }
        contentView.yoga.applyLayout(preservingOrigin: true)
    }
    
}
