//
//  SkillTest+Extenstion.swift
//  Mini CV Tests
//
//  Created by Sergei Semko on 8/18/23.
//

import Foundation
@testable import Mini_CV


extension Skill: Equatable {
    public static func == (lhs: Skill, rhs: Skill) -> Bool {
        return lhs.name == rhs.name
    }
}


