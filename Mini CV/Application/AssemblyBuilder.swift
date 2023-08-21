//
//  AssemblyBuilder.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

import UIKit

protocol AssemblyBuilderProtocol {
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
            fullName: mockData.fullName,
            description: mockData.description,
            location: mockData.location,
            about: mockData.aboutMe
        )
        
        let viewController = CVViewController(skillsService: skillService, profile: profile)
        
        
        let navigationController = UINavigationController(rootViewController: viewController)
        setupNavigationController(navigationController: navigationController, title: mockData.viewControllerTitle)
        return navigationController
    }
    
    private func setupNavigationController(navigationController: UINavigationController, title: String) {
//        navigationController.hidesBarsOnSwipe = true
//        navigationController.navigationBar.backgroundColor = UIColor(named: AppColors.gray)
        navigationController.viewControllers.first?.title = title
    }
}
