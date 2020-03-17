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
    private let cellIdentifier = "collectionViewCell"
    private let photoLibraryManager = PhotoLibraryManager()

    var allPhotos: PHFetchResult<PHAsset>? = PHAsset.fetchAssets(with: nil)
     let imageManager = PHCachingImageManager()
     let imageSize = CGSize(width: 100, height: 100)

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PHAsset.fetchAssets(with: nil).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        imageManager.requestImage(for: (allPhotos?[indexPath.row])!, targetSize: imageSize, contentMode: PHImageContentMode.aspectFill, options: nil) { (image, info) -> Void in
            if (image != nil) {
                (cell as! CollectionViewCell).imageView.image = image
            }
        }
        
        return cell
    }
    
}
