//
//  AddSkillCollectionViewCell.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/19/23.
//

import UIKit

final class AddSkillCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: AddSkillCollectionViewCell.self)
    
    private let addSkillButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(AppSystemImages.plus, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupContentView() {
        contentView.backgroundColor = AppColors.gray
        contentView.layer.cornerRadius = 12

        contentView.addSubview(addSkillButton)
    }
    
}

private extension AddSkillCollectionViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            addSkillButton.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: AppConstantsConstraints.verticalSkill
            ),
            addSkillButton.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -AppConstantsConstraints.verticalSkill
            ),
            addSkillButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: AppConstantsConstraints.horizontalSkill
            ),
            addSkillButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -AppConstantsConstraints.horizontalSkill
            )
        ])
    }
}
