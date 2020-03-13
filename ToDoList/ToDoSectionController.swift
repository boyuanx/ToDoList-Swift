//
//  ModelSectionController.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/12/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import Foundation
import IGListKit

protocol ToDoCellDeleteDelegate: class {
    func delete(model: Model)
}

class ToDoSectionController: ListSectionController, ToDoCellDeleteDelegate {
    
    var currentModel: Model?
    weak var adapter: ListAdapter?
    
    override func didUpdate(to object: Any) {
        guard let model = object as? Model else {
            return
        }
        currentModel = model
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let context = collectionContext, let model = currentModel else {
            return UICollectionViewCell()
        }
        let cell = context.dequeueReusableCell(of: ToDoCollectionViewCell.self, for: self, at: index)
        guard let todoCell = cell as? ToDoCollectionViewCell else {
            return cell
        }
        todoCell.delegate = self
        todoCell.currentModel = model
        todoCell.setLabelText(text: model.title)
        return todoCell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext?.containerSize.width ?? 0, height: 50)
    }
    
    func delete(model: Model) {
        Global.shared.data = Global.shared.data.filter{ $0 != model }
        adapter?.performUpdates(animated: true, completion: nil)
    }
}
