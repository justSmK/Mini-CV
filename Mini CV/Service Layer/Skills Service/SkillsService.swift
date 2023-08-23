//
//  SkillsService.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

final class SkillsService {
    
    private let storageManager: StorageManagerProtocol
    private let defaultsSkills: [Skill]
    
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
