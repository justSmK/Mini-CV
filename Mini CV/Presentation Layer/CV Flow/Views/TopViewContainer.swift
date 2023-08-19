//
//  TopViewContainer.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/19/23.
//

import UIKit

final class TopViewContainer: UIView {
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = ConstantsSizes.avatarImage / 2
        return imageView
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = AppFonts.fullName
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.font = AppFonts.description
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.font = AppFonts.location
        
        #warning("Move this code")
//        let attachment = NSTextAttachment()
//        attachment.image = UIImage(named: AppIcons.location)
        let attributedText = NSMutableAttributedString(string: MockData.shared.location)
//        attributedText.insert(NSAttributedString(attachment: attachment), at: 0)
        
//        label.attributedText = attributedText
        
        label.attributedText = .init(AttributedString(MockData.shared.location))
        
        return label
    }()
    
    private let locationIconImage = AppIcons.location
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupData()
        setupLayout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


private extension TopViewContainer {
    private func setupData() {
        avatarImageView.image = AppImages.profile
        fullNameLabel.text = MockData.shared.fullName
        descriptionLabel.text = MockData.shared.description
//        locationLabel.text = MockData.shared.location
    }
    
    func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray6
        
        addSubviews(
            avatarImageView,
            fullNameLabel,
            descriptionLabel,
            locationLabel
        )
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: ConstantsSizes.avatarImage),
            avatarImageView.widthAnchor.constraint(equalToConstant: ConstantsSizes.avatarImage),
            
            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            fullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 113),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -113),
            
            descriptionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 51),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -51),
            
            locationLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150),
            locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
