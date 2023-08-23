//
//  BottomViewContainer.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/23/23.
//

import UIKit

final class BottomViewContainer: UIView {
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColors.label
        label.textAlignment = .left
        label.font = AppFonts.about
        
        label.text = MockData.shared.aboutMe
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColors.label
        label.numberOfLines = 0
        label.font = AppFonts.aboutDescription
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(description: String) {
        descriptionLabel.text = description
    }
}

private extension BottomViewContainer {
    func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = AppColors.background
        
        addSubviews(
            aboutLabel,
            descriptionLabel
        )
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: topAnchor),
            aboutLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
