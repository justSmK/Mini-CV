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
    
    private var isEditMode: Bool = false
    
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
        cvView.configureData(profile: self.profile, collectionViewDataSource: self, buttonDelegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func loadData() {
        skillModels = skillsService.fetchSkills()
    }
    
    private func deleteSkill(skillModel: Skill) {
        guard let index = skillModels.firstIndex(where: { $0.name == skillModel.name }) else {
            return
        }
                
        let indexPath = IndexPath(item: index, section: 0)
        skillModels.remove(at: index)
        cvView.deleteItemsInCollectionView(indexPath: indexPath)
        cvView.reloadData()
        skillsService.saveSkills(skillModels) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showToastMessage()
        }
    }
    
    private func addSkill(name: String) {
        let newSkill = Skill(name: name)
        skillModels.append(newSkill)
        
        cvView.reloadData()
        skillsService.saveSkills(skillModels) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showToastMessage()
        }
    }
    
    private func showToastMessage() {
        let toast = ToastView(message: "Данные сохранены")
        toast.showToast(on: view)
    }
}

// MARK: - UICollectionViewDataSource

extension CVViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let count = skillModels.count
        
        return isEditMode ? count + 1 : count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let currentCollectionView = cvView.collectionForCell
        
        if isEditMode, indexPath.item == skillModels.count {
            return getAddSkillCell(collectionView: currentCollectionView, indexPath: indexPath)
        } else {
            return getSkillCell(collectionView: currentCollectionView, indexPath: indexPath)
        }
    }
}

// MARK: - CVViewControllerDelegate

extension CVViewController: CVViewControllerDelegate {
    func editDidTap() {
        isEditMode.toggle()
        cvView.reloadData()
        
        let image = isEditMode ? AppIcons.checkmark : AppIcons.pencil
        cvView.buttonChange(image: image)
    }
}

// MARK: - Get Cells

private extension CVViewController {
    private func getSkillCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SkillCollectionViewCell.identifier,
            for: indexPath
        ) as? SkillCollectionViewCell else { return UICollectionViewCell() }
        
        let skill = skillModels[indexPath.item]
        #warning("Check constant")
        let width = view.frame.width - 40
        
        cell.configure(skill: skill, isEdit: isEditMode, maxWidth: width) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.deleteSkill(skillModel: skill)
        }
        
        return cell
    }
    
    private func getAddSkillCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AddSkillCollectionViewCell.identifier,
            for: indexPath
        ) as? AddSkillCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure {
            AlertManager.addSkillAlert(on: self) { [weak self] string in
                self?.addSkill(name: string)
                print(string)
            }
        }
        
        return cell
    }
}
