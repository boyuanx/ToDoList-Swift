//
//  FirebaseService.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/23/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FirebaseService {
    
    private init() {}
    static let shared = FirebaseService()
    let postsRef = Firestore.firestore().collection("posts")
    var postsListener: ListenerRegistration!
}

extension FirebaseService {
    
    func startPostListener(completion: @escaping (Error?) -> Void) {
        postsListener = postsRef.addSnapshotListener { (snapshot, error) in
            if let error = error {
                completion(error)
                return
            }
            if let snapshot = snapshot {
                let docArray = snapshot.documents
                Global.shared.data.removeAll()
                for document in docArray {
                    Global.shared.data.append(Post(dictionary: document.data(), documentId: document.documentID))
                }
            }
        }
    }
    
    func stopPostListener() {
        postsListener.remove()
    }
    
    func createPost(_ post: Post, completion: @escaping (Error?) -> Void) {
        postsRef.document().setData(post.getDictRepresentation()) { (error) in
            completion(error)
        }
    }
    
}
