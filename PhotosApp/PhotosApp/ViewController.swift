//
//  ViewController.swift
//  PhotosApp
//
//  Created by Viet on 2020/03/16.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)

        let red: CGFloat = indexPath.item % 2 == 0 ? 0 : 0.8
        let green: CGFloat = indexPath.item % 3 == 0 ? 0 : 0.8
        let blue: CGFloat = indexPath.item % 5 == 0 ? 0 : 0.8

        cell.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)

        return cell
    }

}

