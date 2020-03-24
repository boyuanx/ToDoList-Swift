//
//  Model.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/12/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import Foundation
import IGListDiffKit

class Model {
    private var UID = UUID().uuidString
    private(set) var title = String()
    
    init(title: String) {
        self.title = title
    }
}

extension Model: ListDiffable, Equatable {
    
    static func == (lhs: Model, rhs: Model) -> Bool {
        return lhs.UID == rhs.UID
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return UID as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Model else {
            return false
        }
        return self.UID == object.UID
    }
    
}
