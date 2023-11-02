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
    func showAlert(title: String, message: String, completion: @escaping () -> ()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        let retryAction = UIAlertAction(title: "Retry", style: .default) { alertAction in
            completion()
        }
        alertController.addAction(okAction)
        alertController.addAction(retryAction)
        present(alertController, animated: true, completion: nil)
    }
}
