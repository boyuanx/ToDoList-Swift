//
//  ModelSectionController.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/12/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import Foundation
import IGListKit
import SwipeCellKit

class ToDoSectionController: ListSectionController, SwipeCollectionViewCellDelegate {
    
    var currentPost: Post?
    weak var adapter: ListAdapter?
    
    override func didUpdate(to object: Any) {
        guard let post = object as? Post else {
            return
        }
        currentPost = post
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let context = collectionContext, let post = currentPost else {
            return UICollectionViewCell()
        }
        let cell = context.dequeueReusableCell(of: ToDoCollectionViewCell.self, for: self, at: index)
        guard let todoCell = cell as? ToDoCollectionViewCell else {
            return cell
        }
        todoCell.delegate = self
        todoCell.titleLabel.text = post.name
        todoCell.timestampLabel.text = post.date.description
        todoCell.contentLabel.text = post.content
        return todoCell
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        let deleteAction = SwipeAction(style: .default, title: "Delete") { [weak self] (action, thisIndexPath) in
            self?.delete(post: (self?.currentPost)!)
        }
        return [deleteAction]
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext?.containerSize.width ?? 0, height: 50)
    }
    
    func delete(post: Post) {
        Global.shared.data = Global.shared.data.filter{ $0 != post }
        adapter?.performUpdates(animated: true, completion: nil)
    }
    
    
}
