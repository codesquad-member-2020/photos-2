//
//  ViewController.swift
//  PhotosApp
//
//  Created by Viet on 2020/03/16.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var collectionView: UICollectionView!

    let dataSource = PhotosCollectionDataSource()
    let delegate = PhotosCollectionDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self.dataSource
        self.collectionView.delegate = self.delegate
        self.collectionView.reloadData()
    }
    
}

