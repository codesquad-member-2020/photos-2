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
    
    func request(url: String, methodType: HTTPMethod, body: Data? = nil) -> URLRequest?  {
        guard let url = URL(string: url) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = methodType.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        return request
    }
    
}
