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

    private let skillLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColors.label
        label.font = AppFonts.skill
        return label
    }()

    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(AppSystemImages.xmark, for: .normal)
        return button
    }()

    private var skillLabelTrailingConstraint: NSLayoutConstraint?
    private var skillLabelToCloseButtonTrailingConstraint: NSLayoutConstraint?
    private var contentViewWidthConstraint: NSLayoutConstraint?

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

        contentView.addSubview(skillLabel)
        contentView.addSubview(closeButton)
    }

    // MARK: - Internal Methods

    func configure(skill: Skill, isEdit: Bool, maxWidth: CGFloat) {
        contentView.layoutIfNeeded()

        closeButton.isHidden = true

        skillLabel.text = skill.name
        skillLabel.invalidateIntrinsicContentSize()

        closeButton.isHidden = !isEdit

//        if isEdit {
//            skillLabelTrailingConstraint?.priority = .defaultLow
//            skillLabelToCloseButtonTrailingConstraint?.priority = .defaultHigh
//        } else {
//            skillLabelToCloseButtonTrailingConstraint?.priority = .defaultLow
//            skillLabelTrailingConstraint?.priority = .defaultHigh
//        }

        contentViewWidthConstraint?.constant = maxWidth
    }

}

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
//        skillLabelTrailingConstraint?.priority = .defaultHigh

        NSLayoutConstraint.activate([
            skillLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            skillLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            skillLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])


        // MARK: Close Button Constraints
        skillLabelToCloseButtonTrailingConstraint = skillLabel
            .trailingAnchor
            .constraint(
                equalTo: closeButton.leadingAnchor,
                constant: -10
            )
//        skillLabelToCloseButtonTrailingConstraint?.isActive = false
//        skillLabelToCloseButtonTrailingConstraint?.priority = .defaultLow

        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: AppConstantsSizes.locationIcon.width),
            closeButton.heightAnchor.constraint(equalToConstant: AppConstantsSizes.locationIcon.height),
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),

        ])
    }
}

