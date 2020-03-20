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
        let request = NetworkConnector().request(url: url, methodType: .get)
        sessionDataTask(request: request!) { (image) in
            handler(image)
        }
    }
    
    func sessionDataTask(request: URLRequest, handler: @escaping (UIImage)->()) {
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else { return }
            
            do {
                let anyData = try JSONSerialization.jsonObject(with: data!, options: [])
                self.jsonConvertor(anyData: anyData) { (image) in
                    handler(image)
                }
            } catch {
                
            }
        }
        
        task.resume()
    }
    
    func jsonConvertor(anyData: Any, handler: @escaping (UIImage)->()) {
        if let nsArray = anyData as? NSArray {
            for bundle in nsArray {
                if let nsDictionary = bundle as? NSDictionary {
                    guard let imageString = nsDictionary["image"] as? String else { return }
                    self.urlConvetor(imageString) { (image) in
                        handler(image)
                    }
                }
            }
        }
    }
    
    func urlConvetor(_ imageString: String, handler: @escaping (UIImage)->()) {
         DispatchQueue.global(qos: .background).async {
            do {
                let imageURL = URL(string: imageString)!
                let data = try Data(contentsOf: imageURL)
                let doodleImage = UIImage(data: data)!
                handler(doodleImage)
            } catch {
                
            }
        }
    }
}
