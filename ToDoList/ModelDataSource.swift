//
//  ModelDataSource.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/12/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import Foundation
import IGListKit

class ModelDataSource: NSObject, ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [
            Model(title: "Jack"),
            Model(title: "John"),
            Model(title: "Coronavirus")
        ]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ModelSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
