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
    
    let profileImageName: String = "ProfileImage"
}
