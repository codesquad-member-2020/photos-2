//
//  ViewController.swift
//  PhotosApp
//
//  Created by Viet on 2020/03/16.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataSource = PhotosCollectionDataSource()
    private var photoLibraryManager: PhotoLibraryManager?
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self.dataSource
        self.photoLibraryManager = PhotoLibraryManager()
        
        let url = "https://public.codesquad.kr/jk/doodle.json"

        let connect = ImageRequestManager()
        let collection = connect.request(url: url, methodType: .get)
        print(collection)
        setObserver()
    }
    
    func setObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollectionViewData(_:)), name: .assetCollectionChanged, object: nil)
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
