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
        loadData()
        cvView.configureData(profile: self.profile, delegate: self, dataSource: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        sleep(1)
//        
//        skillModels = skillsService.fetchSkills()
//        skillModels.append(Skill(name: "Test"))
//        skillsService.saveSkills(skillModels) { [weak self] in
//            guard let strongSelf = self else { return }
//            let toast = ToastView(message: "Данные сохранены")
//            toast.showToast(on: strongSelf.view)
//        }
    }
    
    private func loadData() {
        skillModels = skillsService.fetchSkills()
    }
}


extension CVViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skillModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillCollectionViewCell.identifier, for: indexPath) as? SkillCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let skill = skillModels[indexPath.item]
        let maxWidth = view.bounds.width - 32
        
        cell.configure(skill: skill, isEdit: false, maxWidth: maxWidth)
        
        return cell
    }
    
    
}
