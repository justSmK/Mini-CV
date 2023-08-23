//
//  SkillCollectionViewCell.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/19/23.
//

import UIKit

final class SkillCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: SkillCollectionViewCell.self)

    // MARK: - Private Properties
    
    private var removeSkillAction: (() -> Void)?

    private let skillLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColors.label
        label.font = AppFonts.skill
        label.tintColor = AppColors.tint
        return label
    }()

    private lazy var removeSkillButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(AppSystemImages.xmark, for: .normal)
        button.tintColor = AppColors.tint
        button.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
        return button
    }()

    private var skillLabelTrailingConstraint: NSLayoutConstraint?
    private var skillLabelToCloseButtonTrailingConstraint: NSLayoutConstraint?
    private var contentViewWidthConstraint: NSLayoutConstraint?
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods

    private func setupContentView() {
        contentView.backgroundColor = AppColors.gray
        contentView.layer.cornerRadius = 12

        contentView.addSubview(skillLabel)
        contentView.addSubview(removeSkillButton)
    }
    
    @objc
    private func removeButtonTapped(_ sender: UIButton) {
        removeSkillAction?()
    }

    // MARK: - Internal Methods

    func configure(skill: Skill, isEdit: Bool, maxWidth: CGFloat, removeAction: @escaping (() -> Void)) {
        contentView.layoutIfNeeded()

        removeSkillButton.isHidden = true

        skillLabel.text = skill.name
        skillLabel.invalidateIntrinsicContentSize()

        removeSkillButton.isHidden = !isEdit

        if isEdit {
            skillLabelTrailingConstraint?.priority = .defaultLow
            skillLabelToCloseButtonTrailingConstraint?.priority = .defaultHigh
        } else {
            skillLabelToCloseButtonTrailingConstraint?.priority = .defaultLow
            skillLabelTrailingConstraint?.priority = .defaultHigh
        }

        contentViewWidthConstraint?.constant = maxWidth
        
        removeSkillAction = removeAction
    }
}

// MARK: - Setup Constraints

private extension SkillCollectionViewCell {
    func setupConstraints() {

        contentViewWidthConstraint = contentView.widthAnchor.constraint(lessThanOrEqualToConstant: 320)
        contentViewWidthConstraint?.isActive = true

        // MARK: Skill Label Constraints
        skillLabelTrailingConstraint = skillLabel
            .trailingAnchor
            .constraint(
                equalTo: contentView.trailingAnchor,
                constant: -24
            )
        skillLabelTrailingConstraint?.isActive = true
        skillLabelTrailingConstraint?.priority = .defaultHigh

        NSLayoutConstraint.activate([
            skillLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            skillLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            skillLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])


        // MARK: Close Button Constraints
        skillLabelToCloseButtonTrailingConstraint = skillLabel
            .trailingAnchor
            .constraint(
                equalTo: removeSkillButton.leadingAnchor,
                constant: -10
            )
        skillLabelToCloseButtonTrailingConstraint?.isActive = true
        skillLabelToCloseButtonTrailingConstraint?.priority = .defaultLow

        NSLayoutConstraint.activate([
            removeSkillButton.widthAnchor.constraint(equalToConstant: AppConstantsSizes.locationIcon.width),
            removeSkillButton.heightAnchor.constraint(equalToConstant: AppConstantsSizes.locationIcon.height),
//            removeSkillButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            removeSkillButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            removeSkillButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
        ])
    }
}

