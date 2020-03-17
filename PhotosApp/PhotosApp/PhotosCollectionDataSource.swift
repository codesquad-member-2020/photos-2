//
//  PhotosCollectionDataSource.swift
//  PhotosApp
//
//  Created by delma on 2020/03/16.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit

class PhotosCollectionDataSource: NSObject, UICollectionViewDataSource {
    private let cellIdentifier = "collectionViewCell"
    private let photoLibraryManager = PhotoLibraryManager()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoLibraryManager.allPhotos!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        photoLibraryManager.requestImage(cell: cell as! CollectionViewCell, indexPath: indexPath)
        return cell
    }
    
}
