//
//  DoodleViewController.swift
//  PhotosApp
//
//  Created by Viet on 2020/03/18.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit


class DoodleViewController: UICollectionViewController {
    let defaultImage = #imageLiteral(resourceName: "defualtImage")
    var allImages: [UIImage] = []
    private let reuseIdentifier = "doodleViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = .darkGray
        self.navigationItem.title = "Doodles"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close))
        
        getAllImages()
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func requestImage(handler: @escaping (UIImage?) -> ()) {
        let url = "https://public.codesquad.kr/jk/doodle.json"
        let connect = ImageRequestManager()
        connect.request(url: url, methodType: .get) { image in
            handler(image)
        }
    }
    
    
    func getAllImages(){
        self.requestImage(handler: { (image) in
            guard let img = image else { return }
            self.allImages.append(img)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
    
    func setImageToCell(cell: UICollectionViewCell, indexPath: IndexPath) {
        
        if self.allImages.count != 0, indexPath.item < self.allImages.count {
            let image = self.allImages[indexPath.item]
            (cell as! DoodleViewCell).setImage(image)
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allImages.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        DispatchQueue.main.async {
            self.setImageToCell(cell: cell, indexPath: indexPath)
        }
        return cell
    }
    
    
    
}
