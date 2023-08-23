//
//  CVViewControllerDelegate.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/23/23.
//

protocol CVViewControllerDelegate: AnyObject {
    
    /// Called when the edit action is triggered within the CVViewController.
    func editDidTap()
}
