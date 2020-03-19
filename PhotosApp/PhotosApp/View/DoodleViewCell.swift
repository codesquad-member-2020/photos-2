//
//  DoodleViewCell.swift
//  PhotosApp
//
//  Created by Viet on 2020/03/18.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit

class DoodleViewCell: UICollectionViewCell {
    @IBOutlet var imageView2: UIImageView!
    func setImage(_ image: UIImage) {
        DispatchQueue.main.async {
                self.imageView2.image = image
        }
    }
}
