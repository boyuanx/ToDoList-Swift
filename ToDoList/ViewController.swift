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

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    @objc func addItemAction() {
        
    }

}


extension ViewController {
    
    // MARK: - Basic UI setup
    func initUI() {
        view.backgroundColor = .white
        title = "Todos"
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemAction)), animated: false)
    }

    // MARK: - Collection View setup
    func initCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        // This can be massively simplified using DSLs such as SnapKit.
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}

// MARK: - All things IGListKit
extension ViewController: ListAdapterDataSource {
    
    func initIGListKit() {
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        <#code#>
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        <#code#>
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        <#code#>
    }
    
    
}
