//
//  ErrorHandler.swift
//  PhotosApp
//
//  Created by delma on 2020/03/20.
//  Copyright © 2020 Codesquad. All rights reserved.
//

import UIKit

class ErrorHandler {
    func showAlertImageDownFail() {
        let title = "Fail"
        let message = "이미지를 다운로드하는데 실패했습니다."
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        let showFailAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(showFailAction)
    }
}
