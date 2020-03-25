//
//  Global.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/12/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import Foundation
import IGListKit

class Global {
    
    private init() {}
    static let shared = Global()
    weak var listAdapterDelegate: ListAdapter?
    
    var data: [Post] = [Post]() {
        didSet {
            listAdapterDelegate?.performUpdates(animated: true, completion: nil)
        }
    }
    
}
