//
//  AssemblyModuleBuilder.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createCVViewController() -> UIViewController
}

struct AssemblyBuilder: AssemblyBuilderProtocol {
    func createCVViewController() -> UIViewController {
        let viewController = ViewController()
        
        return viewController
    }
}
