//
//  ViewController.swift
//  ToDoList
//
//  Created by Boyuan Xu on 3/12/20.
//  Copyright © 2020 Boyuan Xu. All rights reserved.
//

import UIKit
import IGListKit
import MaterialComponents
import YogaKit

class ToDoViewController: UIViewController {
    
    var collectionView: UICollectionView!
    lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    let dataSource = ToDoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initCollectionView()
        initIGListKit()
    }

    @objc func addItemAction() {
//        let alertController = MDCAlertController(title: "Add Item", message: nil)
//        let textField = UITextField()
//        textField.backgroundColor = .secondarySystemFill
//        alertController.backgroundColor = .lightGray
//        alertController.accessoryView = textField
//        alertController.addAction(MDCAlertAction(title: "OK", handler: { [weak self] (action) in
//            if let text = textField.text {
//                if text.isEmpty {
//                    return
//                }
//                let newModel = Model(title: text)
//                Global.shared.data.append(newModel)
//                self?.adapter.performUpdates(animated: true, completion: nil)
//            }
//        }))
//        present(alertController, animated: true, completion: nil)
    }

}


extension ToDoViewController {
    
    // MARK: - Basic UI setup
    func initUI() {
        view.backgroundColor = .systemBackground
        title = "Todos"
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemAction)), animated: false)
    }

    // MARK: - Collection View setup
    func initCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.alwaysBounceVertical = true
        view.addSubview(collectionView)
        // This can be massively simplified using DSLs such as SnapKit.
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}

// MARK: - All things IGListKit
extension ToDoViewController {
    
    func initIGListKit() {
        adapter.collectionView = collectionView
        adapter.dataSource = dataSource
    }
    
}
