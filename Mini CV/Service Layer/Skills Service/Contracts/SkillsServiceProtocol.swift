//
//  SkillsServiceProtocol.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

import Foundation

protocol SkillServiceProtocol {
    func fetchSkills() -> [Skill]
    func saveSkills(_ skills: [Skill])
}