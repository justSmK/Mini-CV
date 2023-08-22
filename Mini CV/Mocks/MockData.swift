//
//  MockData.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

struct MockData {
    
    static let shared = MockData()
    
    private init() {}
    
    let defaultsSkills: [Skill] = [
        .init(name: "Swift"),
        .init(name: "UIKit"),
        .init(name: "UserDefaults"),
        .init(name: "Git"),
        .init(name: "iOS development"),
        .init(name: "CoreData"),
        .init(name: "Realm"),
        .init(name: "MVP"),
        .init(name: "MVVM"),
        .init(name: "URLSession"),
        .init(name: "GCD and Operation"),
        
        .init(name: "TestTestTestTestTestTestTestTestTestTestTestTestTestTest")
    ]
    
    let viewControllerTitle: String = "Profile"
    
    let profileImageName: String = "ProfileImage"
    
    let fullName: String = "Semko Sergei Sergeevich"
    
    let description: String = "Middle iOS developer, experience 2 years"
    
    let location: String = "Rostov-on-Don"
    
    let mySkills = "My skills"
    
    let aboutMe = "About me"
    
    let aboutMeDescription = "Experienced software engineer skilled in developing scalable and maintainable systems"
}
