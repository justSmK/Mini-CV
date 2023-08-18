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
    func createCVViewController() -> UIViewController {
        let storageManager: StorageManagerProtocol = StorageManager()
        let defaultsSkills = MockData.shared.defaultsSkills
        let skillService: SkillsServiceProtocol = SkillsService(storageManager: storageManager, skills: defaultsSkills)
        
        let viewController = CVViewController(skillsService: skillService)
        
        return viewController
    }
}
