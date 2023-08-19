//
//  SkillsServiceProtocol.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

protocol SkillsServiceProtocol {
    func fetchSkills() -> [Skill]
    func saveSkills(_ skills: [Skill])
}
