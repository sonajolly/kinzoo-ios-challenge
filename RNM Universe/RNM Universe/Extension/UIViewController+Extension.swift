//
//  UIViewController+Extension.swift
//  RNM Universe
//
//  Created by Sona Maria Jolly on 29/10/23.
//

import UIKit
import Foundation
extension UIViewController {
    // Show alert with title and message
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
