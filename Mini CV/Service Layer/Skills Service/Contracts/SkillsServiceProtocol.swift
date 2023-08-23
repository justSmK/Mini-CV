//
//  SkillsServiceProtocol.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

protocol SkillsServiceProtocol: AnyObject {
    /// A function for extracting skills.
    /// - Returns: Array of skills. If no skills are found, returns the default values.
    func fetchSkills() -> [Skill]
    
    
    /// Saves skills.
    /// - Parameters:
    ///   - skills: Array of skills to save.
    ///   - completion: The completion block is called after saving.
    func saveSkills(_ skills: [Skill], completion: @escaping () -> Void)
}
