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
        imageView.layer.cornerRadius = AppConstantsSizes.avatarImage.width / 2
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
        label.font = AppFonts.description
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 1
//        label.adjustsFontSizeToFitWidth = true
        label.font = AppFonts.location
        return label
    }()
    
    private let locationIconImage = AppIcons.location
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(profile: Profile) {
        avatarImageView.image = UIImage(named: profile.imageName)
        fullNameLabel.text = profile.fullName
        descriptionLabel.text = profile.description
        
        guard let locationIconImage else { return }
        let attachment = NSTextAttachment(image: locationIconImage)
        locationLabel.attributedText = setupAttributedString(originString: profile.location, label: locationLabel, attachment: attachment)
    }
}


private extension TopViewContainer {
    func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = AppColors.gray
        
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
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: AppConstantsSizes.avatarImage.height),
            avatarImageView.widthAnchor.constraint(equalToConstant: AppConstantsSizes.avatarImage.width),
            
            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            fullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 113),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -113),
            
            descriptionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 51),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -51),
            
            locationLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
//            locationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
}

private extension TopViewContainer {
    func setupAttributedString(originString: String, label: UILabel, attachment: NSTextAttachment) -> NSMutableAttributedString {
        let mid = label.font.capHeight - (attachment.image?.size.height ?? 0) / 2.5
        
        guard let image = attachment.image else { return  NSMutableAttributedString() }
        
        attachment.bounds = CGRect(x: 0, y: -mid, width: image.size.width, height: image.size.height)
        
        let attributedString = NSAttributedString(attachment: attachment)
        
        let mutableAttributedString = NSMutableAttributedString(string: originString)
        mutableAttributedString.insert(attributedString, at: 0)
        
        return mutableAttributedString
    }
}
