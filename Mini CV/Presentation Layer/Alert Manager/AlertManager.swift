//
//  AlertManager.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/23/23.
//

import UIKit

final class AlertManager {
    struct AlertAction {
        let title: String
        let style: UIAlertAction.Style
        let handler: ((String) -> Void)
    }
    
    private static func showTextFieldAlert(on viewController: UIViewController, title: String, message: String? = nil, textField: @escaping (UITextField) -> Void, actions: [AlertAction]) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: textField)
        
        actions.forEach { action in
            alertController.addAction(UIAlertAction(title: action.title, style: action.style, handler: { _ in
                let string = alertController.textFields?.first?.text ?? ""
                action.handler(string)
            }))
        }
        
        DispatchQueue.main.async {
            viewController.present(alertController, animated: true)
        }
    }
    
    static func addSkillAlert(on viewController: UIViewController, completion: @escaping (String) -> Void) {
        
        let textField: (UITextField) -> () = { textField in
            textField.placeholder = "Skill Name"
        }
        
        let actions: [AlertAction] = [
            AlertAction(title: "Cancel", style: .cancel, handler: { _ in completion(String()) }),
            AlertAction(title: "Confirm", style: .default, handler: completion)
        ]
        
        self.showTextFieldAlert(on: viewController, title: "Add Skill", textField: textField, actions: actions)
        
    }
}
