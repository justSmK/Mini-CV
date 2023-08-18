//
//  SceneDelegate.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let assemblyBuilder: AssemblyBuilderProtocol = AssemblyBuilder()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = assemblyBuilder.createCVViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

