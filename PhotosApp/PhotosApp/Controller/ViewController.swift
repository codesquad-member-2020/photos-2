//
//  ViewController.swift
//  PhotosApp
//
//  Created by Viet on 2020/03/16.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController
{
    
    // MARK: Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    let dataSource = PhotosCollectionDataSource()
    private var photoLibraryManager: PhotoLibraryManager?
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self.dataSource
        self.photoLibraryManager = PhotoLibraryManager()
        
        setObserver()


        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(gesture:)))
        gestureRecognizer.delegate = self
        collectionView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func handleTapGesture(gesture: UIGestureRecognizer) {
        let point = gesture.location(in: collectionView)
        guard let indexPath = collectionView?.indexPathForItem(at: point) else { return }

        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        let menuItem = UIMenuItem(title: "Save", action: #selector(saveImage))

        UIMenuController.shared.menuItems = [menuItem]
        UIMenuController.shared.showMenu(from: cell, rect: cell.contentView.frame)
        cell.becomeFirstResponder()
    }

    @objc func saveImage() {
        print("save image")
    }
    
    func setObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollectionViewData(_:)), name: .assetCollectionChanged, object: nil)
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let doodleController = storyboard.instantiateViewController(withIdentifier: "Doodle")
        let navigationController = UINavigationController(rootViewController: doodleController)
        present(navigationController, animated: true, completion: nil)
    }

    
    @objc func reloadCollectionViewData(_ notification: Notification) {
        DispatchQueue.main.async {
            guard let collectionView = self.collectionView else { return }

            if let changes = notification.userInfo?["changed"] as? PHFetchResultChangeDetails<PHAsset> {
                if changes.hasIncrementalChanges {
                    collectionView.performBatchUpdates({
                        if let removed = changes.removedIndexes, removed.count > 0 {
                            collectionView.deleteItems(at: removed.map { IndexPath(item: $0, section:0) })
                        }
                        if let inserted = changes.insertedIndexes, inserted.count > 0 {
                            collectionView.insertItems(at: inserted.map { IndexPath(item: $0, section:0) })
                        }
                        if let changed = changes.changedIndexes, changed.count > 0 {
                            collectionView.reloadItems(at: changed.map { IndexPath(item: $0, section:0) })
                        }
                        changes.enumerateMoves { fromIndex, toIndex in
                            collectionView.moveItem(at: IndexPath(item: fromIndex, section: 0),
                                                    to: IndexPath(item: toIndex, section: 0))
                        }
                    })
                } else {
                    collectionView.reloadData()
                }
            }
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: .assetCollectionChanged, object: nil)
    }

}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let point = touch.location(in: collectionView)
        if let indexPath = collectionView.indexPathForItem(at: point), let _ = collectionView.cellForItem(at: indexPath) {
            return true
        }

        return false
    }
}
