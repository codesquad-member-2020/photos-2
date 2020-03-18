//
//  ImageRequestManager.swift
//  PhotosApp
//
//  Created by delma on 2020/03/18.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import Foundation
class ImageRequestManager {
    
    var imageCollection: [ImageData] = []
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    func request(url: String, methodType: HTTPMethod, body: Data? = nil) -> [ImageData]? {
        guard let url = URL(string: url) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = methodType.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            do {
                let anyData = try JSONSerialization.jsonObject(with: data!, options: [])
                self.setImageData(anyData)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
        
        return self.imageCollection
    }
    
    func setImageData(_ anyData: Any) {

        if let nsArray = anyData as? NSArray {
            for bundle in nsArray {
                if let nsDictionary = bundle as? NSDictionary {
                    if let title = nsDictionary["title"] as? String,
                        let image = nsDictionary["image"] as? String,
                        let date = nsDictionary["date"] as? String {
                        let imageData = ImageData(title: title, image: image, date: date)
                        print(imageData)
                        imageCollection.append(imageData)
                    }
                }
            }
        }
    }
    
}
