//
//  CVView.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/19/23.
//

import UIKit

typealias MyCollectionViewDelegates = UICollectionViewDelegateFlowLayout & UICollectionViewDataSource

final class CVView: UIView {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.bounces = false
        return scrollView
    }()
    
    private let scrollContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    private let topViewContainer = TopViewContainer()
    
    private let skillsCollectionView = SkillsCollectionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(profile: Profile, delegate: UICollectionViewDelegateFlowLayout, dataSource: UICollectionViewDataSource) {
        topViewContainer.configureData(profile: profile)
        skillsCollectionView.delegate = delegate
        skillsCollectionView.dataSource = dataSource
    }
}

private extension CVView {
    func setupLayout() {
        self.addSubviews(
            scrollView
        )
        scrollView.addSubview(scrollContainerView)
        scrollContainerView.addSubviews(
            topViewContainer,
            skillsCollectionView
        )
    }
    
    func setupConstraints() {
        let scrollContentLayoutGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            scrollContainerView.topAnchor.constraint(equalTo: scrollContentLayoutGuide.topAnchor),
            scrollContainerView.leadingAnchor.constraint(equalTo: scrollContentLayoutGuide.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollContentLayoutGuide.trailingAnchor),
            scrollContainerView.bottomAnchor.constraint(equalTo: scrollContentLayoutGuide.bottomAnchor),
            
            scrollContainerView.heightAnchor.constraint(equalToConstant: 1000),
            scrollContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            topViewContainer.topAnchor.constraint(equalTo: scrollContainerView.topAnchor),
            topViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            topViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            skillsCollectionView.topAnchor.constraint(equalTo: topViewContainer.bottomAnchor, constant: 20),
            skillsCollectionView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: AppConstantsConstraints.collectionViewHorizontal
            ),
            skillsCollectionView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -AppConstantsConstraints.collectionViewHorizontal
            ),
        ])
    }
}