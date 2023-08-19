//
//  CVViewController.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

import UIKit

class CVViewController: UIViewController {
    
    private let skillsService: SkillsServiceProtocol
    
    private let cvView = CVView()
    
    private var skillModels = [Skill]()
    
    init(skillsService: SkillsServiceProtocol) {
        self.skillsService = skillsService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = cvView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.background
        cvView.setupDelegate(delegate: self)
    }
}

private extension CVViewController {
    private func setupConstraints() {
        
    }
}

