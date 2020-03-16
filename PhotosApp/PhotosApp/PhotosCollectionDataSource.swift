//
//  PhotosCollectionDataSource.swift
//  PhotosApp
//
//  Created by delma on 2020/03/16.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit
import Photos

class PhotosCollectionDataSource: NSObject, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PHAsset.fetchAssets(with: nil).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        
        return cell
    }
    
}
