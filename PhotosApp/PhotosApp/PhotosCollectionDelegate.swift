//
//  PhotosCollectionDelegate.swift
//  PhotosApp
//
//  Created by delma on 2020/03/16.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit
import Photos

class PhotosCollectionDelegate: NSObject, UICollectionViewDelegate {
    var allPhotos: PHFetchResult<PHAsset>? = PHAsset.fetchAssets(with: nil)
    let imageManager = PHCachingImageManager()

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           let options = PHImageRequestOptions()
           options.isNetworkAccessAllowed = true
           options.isSynchronous = false
           imageManager.requestImage(for: (allPhotos?[indexPath.row])!, targetSize: CGSize(width: 100, height: 100), contentMode: PHImageContentMode.aspectFill, options: options) { (image, info) -> Void in
               if (image != nil) {
                   (cell as! CollectionViewCell).image.image = image
               }
           }
       }
}
