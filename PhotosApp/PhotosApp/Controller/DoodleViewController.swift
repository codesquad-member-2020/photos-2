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
    let imageDownloader = ImageDownloader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = .darkGray
        self.navigationItem.title = "Doodles"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close))
        
        getAllImages()
        addGestureRecognizerOnImage()
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getAllImages(){
        imageDownloader.requestImage(handler: { (image) in
            guard let img = image else { return }
            self.allImages.append(img)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
    
    private func inputImage(cell: UICollectionViewCell, indexPath: IndexPath) {
        
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
        self.inputImage(cell: cell, indexPath: indexPath)
        return cell
    }

    // MARK: GestureRecognizer

    func addGestureRecognizerOnImage() {
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        gestureRecognizer.delegate = self
        print(gestureRecognizer.minimumPressDuration)
        collectionView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func handleGesture(gesture: UIGestureRecognizer) {
        let point = gesture.location(in: collectionView)
        guard let indexPath = collectionView?.indexPathForItem(at: point) else { return }

        let cell = collectionView.cellForItem(at: indexPath) as! DoodleViewCell
        let menuItem = UIMenuItem(title: "Save", action: #selector(saveImage))

        UIMenuController.shared.menuItems = [menuItem]
        UIMenuController.shared.showMenu(from: cell, rect: cell.contentView.frame)
        cell.becomeFirstResponder()
    }

    @objc func saveImage() {
        print("save image")
    }

}

extension DoodleViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let point = touch.location(in: collectionView)
        if let indexPath = collectionView.indexPathForItem(at: point), let _ = collectionView.cellForItem(at: indexPath) {
            return true
        }

        return false
    }
}
