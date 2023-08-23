//
//  AssemblyBuilder.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

import UIKit

protocol AssemblyBuilderProtocol {
    
    /// Creates and configures a CVViewController.
    /// - Returns: A configured UIViewController instance, wrapped inside a UINavigationController.
    func createCVViewController() -> UIViewController
}

struct AssemblyBuilder: AssemblyBuilderProtocol {
    
    private var navigationController: UINavigationController?
    
    private let mockData = MockData.shared
    
    func createCVViewController() -> UIViewController {
        let storageManager: StorageManagerProtocol = StorageManager()
        let defaultsSkills = mockData.defaultsSkills
        let skillService: SkillsServiceProtocol = SkillsService(storageManager: storageManager, skills: defaultsSkills)
        
        let profile = Profile(
            imageName: mockData.profileImageName,
            fullName: LocalizationKeys.fullName,
            description: LocalizationKeys.descriptionText,
            location: LocalizationKeys.locationText,
            about: LocalizationKeys.aboutDescriptionText
        )
        
        let viewController = CVViewController(skillsService: skillService, profile: profile)
        
        
        let navigationController = UINavigationController(rootViewController: viewController)
        setupNavigationController(navigationController: navigationController, title: LocalizationKeys.cvVCTitle)
        return navigationController
    }
    
    
    /// Private method to set up a navigation controller with a specific title.
    /// - Parameters:
    ///   - navigationController: The navigation controller to set up.
    ///   - title: The title to assign to the first view controller within the navigation controller.
    private func setupNavigationController(navigationController: UINavigationController, title: String) {
        navigationController.viewControllers.first?.title = title
    }
}
