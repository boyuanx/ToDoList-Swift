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
    
    var data = [
        Model(title: "Go to school"),
        Model(title: "Catch COVID-19"),
        Model(title: "Pay $3k to get tested")
    ]
    
}
