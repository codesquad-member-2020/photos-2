//
//  PhotoLibraryObserver.swift
//  PhotosApp
//
//  Created by Viet on 2020/03/17.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit
import Photos

class PhotoLibraryManager: NSObject, PHPhotoLibraryChangeObserver {
    var allPhotos: PHFetchResult<PHAsset>? = PHAsset.fetchAssets(with: nil)
    let imageManager = PHCachingImageManager()
    let imageSize = CGSize(width: 100, height: 100)
    
    func requestImage(cell: CollectionViewCell, indexPath: IndexPath) {
        imageManager.requestImage(for: (allPhotos?[indexPath.row])!, targetSize: imageSize, contentMode: .aspectFill, options: nil) { (image, info) -> Void in
            if (image != nil) {
                cell.setImage(image!)
            }
        }
    }
    
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changed = changeInstance.changeDetails(for: allPhotos!) else { return }
        allPhotos = changed.fetchResultAfterChanges
        NotificationCenter.default.post(name: .assetCollectionChanged, object: nil, userInfo: ["changed": changed])
    }
}
