//
//  MiddleViewContainer.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/23/23.
//

import UIKit

final class MiddleViewContainer: UIView {
    
    // MARK: - Private Properties
    
    private weak var buttonDelegate: CVViewControllerDelegate?
    
    private let mySkillsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFonts.skills
        label.textColor = AppColors.label
        label.text = LocalizationKeys.mySkills
        return label
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(AppIcons.pencil, for: .normal)
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        button.tintColor = AppColors.tint
        return button
    }()
    
    private let skillsCollectionView = SkillsCollectionView()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    @objc
    private func editButtonTapped(_ sender: UIButton) {
        buttonDelegate?.editDidTap()
    }
    
    // MARK: - Internal Methods
    
    func configureData(dataSource: UICollectionViewDataSource, buttonDelegate: CVViewControllerDelegate) {
        skillsCollectionView.dataSource = dataSource
        self.buttonDelegate = buttonDelegate
    }
}

// MARK: - Setup Layout, Constraints

private extension MiddleViewContainer {
    func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = AppColors.background
        
        addSubviews(
            mySkillsLabel,
            editButton,
            skillsCollectionView
        )
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mySkillsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            mySkillsLabel.topAnchor.constraint(equalTo: topAnchor),
            mySkillsLabel.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -30),
            
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            editButton.topAnchor.constraint(equalTo: topAnchor),
            
            skillsCollectionView.topAnchor.constraint(equalTo: mySkillsLabel.bottomAnchor, constant: 20),
            skillsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            skillsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            skillsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

// MARK: - CollectionCVViewProtocol

extension MiddleViewContainer: CollectionCVViewProtocol {
    func reloadData() {
        skillsCollectionView.reloadData()
    }
    
    func buttonChange(image: UIImage?) {
        editButton.setImage(image, for: .normal)
    }
    
    func deleteItemsInCollectionView(indexPath: IndexPath) {
        skillsCollectionView.deleteItems(at: [indexPath])
//        skillsCollectionView.reloadData()
    }
    
    var collectionForCell: UICollectionView {
        return skillsCollectionView
    }
}
