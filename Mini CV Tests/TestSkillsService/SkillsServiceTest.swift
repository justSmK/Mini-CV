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
    
    func testSkillServiceMemoryLeakTeardown() {
        let storageManagereTest = StubStorageManager()
        let skills = MockData.shared.defaultsSkills
        let skillServiceTest = SkillsService(storageManager: storageManagereTest, skills: skills)
        
        let _ = skillServiceTest.fetchSkills()
        
        addTeardownBlock { [weak storageManagereTest, weak skillServiceTest] in
            XCTAssertNil(storageManagereTest, "potential memory leak on \(String(describing: storageManagereTest))")
            XCTAssertNil(skillServiceTest, "potential memory leak on \(String(describing: skillServiceTest))")
        }
    }
    
    func testSkillServiceMemoryLeak() {
        let storageManager = StubStorageManager()
        let skills = MockData.shared.defaultsSkills
        let skillService = SkillsService(storageManager: storageManager, skills: skills)
        
        let _ = skillService.fetchSkills()
        skillService.saveSkills(defaultSkills)
        let _ = skillService.fetchSkills()
        
        trackForMemoryLeak(instance: skillService)
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
