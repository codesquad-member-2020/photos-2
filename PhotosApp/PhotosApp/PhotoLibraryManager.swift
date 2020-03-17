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

    override init() {
        super.init()

        PHPhotoLibrary.shared().register(self)
    }

    func photoLibraryDidChange(_ changeInstance: PHChange) {
//        DispatchQueue.main.async {
//            self.collectionView.reloadData()
//        }
//
        let changed = changeInstance.changeDetails(for: allPhotos!)

    }
}
