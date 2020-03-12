//
//  ModelSectionController.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/12/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import Foundation
import IGListKit

class ModelSectionController: ListSectionController {
    
    var currentModel: Model?
    
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

    }
}
