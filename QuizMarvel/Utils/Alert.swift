//
//  Alert.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 16/08/23.
//

import UIKit

class Alert {
    static func showBasicAlert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            
            let screenInitialViewController = InitialScreenViewController()
            viewController.navigationController?.pushViewController(screenInitialViewController, animated: true)
        }
        
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
