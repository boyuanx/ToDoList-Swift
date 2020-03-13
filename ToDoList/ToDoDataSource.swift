//
//  ModelDataSource.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/12/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import Foundation
import IGListKit

class ToDoDataSource: NSObject, ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return Global.shared.data
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let SC = ToDoSectionController()
        SC.adapter = listAdapter
        SC.inset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        return SC
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
