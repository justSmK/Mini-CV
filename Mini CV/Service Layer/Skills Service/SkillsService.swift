//
//  SkillsService.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

/// A service class to manage skills.
final class SkillsService {
    
    private let storageManager: StorageManagerProtocol
    private let defaultsSkills: [Skill]
    
    
    /// Initializes a new instance of the skills service.
    /// - Parameters:
    ///   - storageManager: A storage manager conforming to `StorageManagerProtocol`.
    ///   - skills: The default skills to return if no skills are found in storage.
    init(storageManager: StorageManagerProtocol, skills: [Skill]) {
        self.storageManager = storageManager
        self.defaultsSkills = skills
    }
}

extension SkillsService: SkillsServiceProtocol {
    func fetchSkills() -> [Skill] {
        guard let skills: [Skill] = storageManager.codableData(forKey: .skills) else {
            return defaultsSkills
        }
        return skills.isEmpty ? defaultsSkills : skills
    }
    
    func saveSkills(_ skills: [Skill], completion: @escaping () -> Void = {}) {
        storageManager.set(skills, forKey: .skills, completion: completion)
    }
}
