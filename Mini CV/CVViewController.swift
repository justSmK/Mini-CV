//
//  CVViewController.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

import UIKit

class CVViewController: UIViewController {
    
    private let skillsService: SkillServiceProtocol
    
    private var skillModels = [Skill]()
    
    init(skillsService: SkillServiceProtocol) {
        self.skillsService = skillsService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        skillModels = skillsService.fetchSkills()
        print(skillModels)
        
        skillModels.append(Skill(name: "Something new"))
        
        skillsService.saveSkills(skillModels)
        
        let test = skillsService.fetchSkills()
        print(test)
        
    }


}

