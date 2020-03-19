//
//  DoodleViewController.swift
//  PhotosApp
//
//  Created by Viet on 2020/03/18.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DoodleViewController: UICollectionViewController, UICollectionViewDataSourcePrefetching {
    
    //    var imagesData: [ImageData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.backgroundColor = .darkGray
        self.navigationItem.title = "Doodles"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close))
        requestImage()
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func requestImage() {
        let url = "https://public.codesquad.kr/jk/doodle.json"
        DispatchQueue.main.async {
            let connect = ImageRequestManager()
            let imageCollection = connect.request(url: url, methodType: .get) { image in
                print(image)
            }
        }
        
    }
    
    //    func setImage() {
    //        requestImage().forEach { (imageData) in
    //            print(imageData.image)
    //        }
    //    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        //
        //        let model = models[indexPath.row]
        //        let id = model.id
        //        cell.representedId = id
        //
        //        // Check if the `asyncFetcher` has already fetched data for the specified identifier.
        //        if let fetchedData = asyncFetcher.fetchedData(for: id) {
        //            // The data has already been fetched and cached; use it to configure the cell.
        //            cell.configure(with: fetchedData)
        //        } else {
        //            // There is no data available; clear the cell until we've fetched data.
        //            cell.configure(with: nil)
        //
        //            // Ask the `asyncFetcher` to fetch data for the specified identifier.
        //            asyncFetcher.fetchAsync(id) { fetchedData in
        //                DispatchQueue.main.async {
        //                    /*
        //                     The `asyncFetcher` has fetched data for the identifier. Before
        //                     updating the cell, check if it has been recycled by the
        //                     collection view to represent other data.
        //                     */
        //                    guard cell.representedId == id else { return }
        //
        //                    // Configure the cell with the fetched image.
        //                    cell.configure(with: fetchedData)
        //                }
        //            }
        //        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
    
    
    
}
