//
//  ViewController.swift
//  PhotosApp
//
//  Created by Viet on 2020/03/16.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, PHPhotoLibraryChangeObserver {

    // MARK: Properties

    @IBOutlet weak var collectionView: UICollectionView!

    let dataSource = PhotosCollectionDataSource()
    let delegate = PhotosCollectionDelegate()

    // MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = self.dataSource
        self.collectionView.delegate = self.delegate
        self.collectionView.reloadData()

        PHPhotoLibrary.shared().register(self)
    }

    // MARK: PHPhotoLibraryChangeObserver

    func photoLibraryDidChange(_ changeInstance: PHChange) {
        print("Photo library did change")
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            print("Reload Data")
        }
    }
}

