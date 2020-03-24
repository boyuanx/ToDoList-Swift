//
//  Post.swift
//  firestore_demo
//
//  Created by Allen Simon Almasi on 3/9/20.
//  Copyright © 2020 Allen Simon Almasi. All rights reserved.
//

import Foundation
import FirebaseFirestore
import IGListDiffKit

class Post {
    var name: String
    var content: String
    var date: Date
    var documentId: String
    
    init(name: String, content: String, date: Date, documentId: String) {
        self.name = name
        self.content = content
        self.date = date
        self.documentId = documentId
    }
    
    init(dictionary: [String: Any], documentId: String) {
        self.name = dictionary["name"] as! String
        self.content = dictionary["content"] as! String
        self.date = (dictionary["date"] as! Timestamp).dateValue()
        self.documentId = documentId
    }
    
    func getDictRepresentation() -> [String: Any] {
        return [
            "name": name,
            "content": content,
            "date": date
        ]
    }
}

extension Post: ListDiffable, Equatable {
    
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.documentId == rhs.documentId
            && lhs.name == rhs.name
            && lhs.content == rhs.content
            && lhs.date == rhs.date
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return documentId as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Post else {
            return false
        }
        return self.documentId == object.documentId
    }
    
}
