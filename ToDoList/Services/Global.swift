//
//  Global.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/12/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import Foundation

class Global {
    
    private init() {}
    static let shared = Global()
    
    var data = [Post]()
    
}
