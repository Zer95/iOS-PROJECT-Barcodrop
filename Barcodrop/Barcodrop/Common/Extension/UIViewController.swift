//
//  UIViewController.swift
//  Barcodrop
//
//  Created by SG on 2022/02/04.
//

import UIKit

extension UIViewController {
    
    // MARK: 확인이 뜨는 UIAlertController
    func presentOkOnlyAlert(title: String, message: String? = nil,
                      handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionDone = UIAlertAction(title: "확인", style: .default, handler: handler)
        alert.addAction(actionDone)
        self.present(alert, animated: true, completion: nil)
    }
    
}
