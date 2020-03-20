//
//  ImageDownloader.swift
//  PhotosApp
//
//  Created by delma on 2020/03/20.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit

class ImageDownloader {
    
    func requestImage(handler: @escaping (UIImage?) -> ()) {
        let url = "https://public.codesquad.kr/jk/doodle.json"
        let connect = NetworkConnector()
        connect.request(url: url, methodType: .get) { image in
            handler(image)
        }
    }
    
}
