//
//  CVViewController.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

import UIKit

class CVViewController: UIViewController {
    
    private let skillsService: SkillsServiceProtocol
    
    private let profile: Profile
    
    private var skillModels = [Skill]()
    
    private let cvView = CVView()
    
    init(skillsService: SkillsServiceProtocol, profile: Profile) {
        self.skillsService = skillsService
        self.profile = profile
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
        cvView.configureData(profile: self.profile)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        sleep(1)
        
        skillModels = skillsService.fetchSkills()
        skillModels.append(Skill(name: "Test"))
        skillsService.saveSkills(skillModels) { [weak self] in
            guard let strongSelf = self else { return }
            let toast = ToastView(message: "Данные сохранены")
            toast.showToast(on: strongSelf.view)
        }
    }
}

private extension CVViewController {
    private func setupConstraints() {
        
    }
}

