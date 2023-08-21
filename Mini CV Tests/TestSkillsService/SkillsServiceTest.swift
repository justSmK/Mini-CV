//
//  SkillsServiceTest.swift
//  Mini CV Tests
//
//  Created by Sergei Semko on 8/18/23.
//

import XCTest
@testable import Mini_CV

final class SkillsServiceTest: XCTestCase {
    
    var skillsService: SkillsServiceProtocol!
    var storageManager: StorageManagerProtocol!
    var defaultSkills = MockData.shared.defaultsSkills

    override func setUpWithError() throws {
        storageManager = StubStorageManager()
        skillsService = SkillsService(storageManager: storageManager, skills: defaultSkills)
    }

    override func tearDownWithError() throws {
        storageManager = nil
        skillsService = nil
    }
    
    func testFetchDefaultSkills() {
        let skills = skillsService.fetchSkills()
        XCTAssertEqual(skills, defaultSkills)
    }
    
    func testFetchSkills() {
        var newSkills = defaultSkills
        newSkills.append(Skill(name: "FooBazBar"))
        
        skillsService.saveSkills(newSkills, completion: {})
        
        let getSkills = skillsService.fetchSkills()
        
        XCTAssertEqual(getSkills, newSkills)
        XCTAssertNotEqual(getSkills, defaultSkills)
    }
    
    
    func testEmptyFetchSkills() {
        var newSkills = defaultSkills
        newSkills.append(Skill(name: "FooBazBar"))
        skillsService.saveSkills(newSkills, completion: {})
        
        skillsService.saveSkills([], completion: {})
        
        let getSkills = skillsService.fetchSkills()
        
        XCTAssertEqual(getSkills, defaultSkills)
    }

}
