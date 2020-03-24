//
//  ToDoCollectionViewCell.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/12/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import UIKit
import SwipeCellKit
import SnapKit

class ToDoCollectionViewCell: SwipeCollectionViewCell {
    
    let titleLabel = UILabel()
    let timestampLabel = UILabel()
    let contentLabel = UILabel()
        
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
    
}

// MARK: - Basic UI
extension ToDoCollectionViewCell {
        
    func initUI() {
        contentView.backgroundColor = .tertiarySystemGroupedBackground
        titleLabel.textColor = .label
        timestampLabel.textColor = .label
        contentLabel.textColor = .label
        contentView.addSubview(titleLabel)
        contentView.addSubview(timestampLabel)
        contentView.addSubview(contentLabel)
    }
    
    func initLayout() {
        titleLabel.snp.makeConstraints { (this) in
            this.top.equalToSuperview().offset(10)
            this.leading.equalToSuperview().offset(10)
        }
        timestampLabel.snp.makeConstraints { (this) in
            this.trailing.equalToSuperview().offset(-10)
            this.centerY.equalTo(titleLabel.snp.centerY)
        }
        contentLabel.snp.makeConstraints { (this) in
            this.top.equalTo(titleLabel.snp.bottom).offset(10)
            this.leading.equalToSuperview().offset(10)
            this.trailing.equalToSuperview().offset(-10)
            this.bottom.equalToSuperview().offset(-10)
        }
    }
    
}
