//
//  ViewController.swift
//  PhotosApp
//
//  Created by Viet on 2020/03/16.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties

    @IBOutlet weak var collectionView: UICollectionView!

    let dataSource = PhotosCollectionDataSource()
    let delegate = PhotosCollectionDelegate()
    private var photoLibraryManager: PhotoLibraryManager?

    // MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = self.dataSource
        self.collectionView.delegate = self.delegate
        self.photoLibraryManager = PhotoLibraryManager()
    }

    // MARK: PHPhotoLibraryChangeObserver

}

