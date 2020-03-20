//
//  NetworkConnector.swift
//  PhotosApp
//
//  Created by delma on 2020/03/18.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import Foundation
import UIKit

class NetworkConnector {
    
    var imageCollection: [ImageData] = []
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    func request(url: String, methodType: HTTPMethod, body: Data? = nil, handler: @escaping (UIImage) -> ())  {
        guard let url = URL(string: url) else { return }
        
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
                if let nsArray = anyData as? NSArray {
                    for bundle in nsArray {
                        if let nsDictionary = bundle as? NSDictionary {
                            guard let imageString = nsDictionary["image"] as? String else {
                                return }
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
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
}
