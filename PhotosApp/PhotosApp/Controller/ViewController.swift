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
        
        setObserver()
    }
    
    func setObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollectionViewData(_:)), name: .assetCollectionChanged, object: nil)
    }
    
    @objc func reloadCollectionViewData(_ notification: Notification) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .assetCollectionChanged, object: nil)
    }
    
}

