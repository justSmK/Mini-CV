//
//  CVView.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/19/23.
//

import UIKit

final class CVView: UIView {
    
    // MARK: - Private Properties

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
        return view
    }()
    
    private let topViewContainer = TopViewContainer()
    
    private let middleViewContainer = MiddleViewContainer()
    
    private let bottomViewContainer = BottomViewContainer()
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal Methods
    
    func configureData(profile: Profile, collectionViewDataSource: UICollectionViewDataSource, buttonDelegate: CVViewControllerDelegate) {
        topViewContainer.configureData(profile: profile)
        middleViewContainer.configureData(dataSource: collectionViewDataSource, buttonDelegate: buttonDelegate)
        bottomViewContainer.configure(description: profile.about)
    }
}

// MARK: - Setup Layout, Constraints

private extension CVView {
    func setupLayout() {
        self.addSubviews(
            scrollView
        )
        scrollView.addSubview(scrollContainerView)
        scrollContainerView.addSubviews(
            topViewContainer,
            middleViewContainer,
            bottomViewContainer
        )
    }
    
    func setupConstraints() {
        let scrollContentLayoutGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            scrollContainerView.topAnchor.constraint(equalTo: scrollContentLayoutGuide.topAnchor),
            scrollContainerView.leadingAnchor.constraint(equalTo: scrollContentLayoutGuide.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollContentLayoutGuide.trailingAnchor),
            scrollContainerView.bottomAnchor.constraint(equalTo: scrollContentLayoutGuide.bottomAnchor),
            
            scrollContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            topViewContainer.topAnchor.constraint(equalTo: scrollContainerView.topAnchor),
            topViewContainer.leadingAnchor.constraint(equalTo: scrollContainerView.leadingAnchor),
            topViewContainer.trailingAnchor.constraint(equalTo: scrollContainerView.trailingAnchor),
            
            middleViewContainer.topAnchor.constraint(equalTo: topViewContainer.bottomAnchor, constant: 20),
            middleViewContainer.leadingAnchor.constraint(
                equalTo: scrollContainerView.leadingAnchor,
                constant: AppConstantsConstraints.viewHorizontal
            ),
            middleViewContainer.trailingAnchor.constraint(
                equalTo: scrollContainerView.trailingAnchor,
                constant: -AppConstantsConstraints.viewHorizontal
            ),
            
            bottomViewContainer.topAnchor.constraint(equalTo: middleViewContainer.bottomAnchor, constant: 24),
            bottomViewContainer.leadingAnchor.constraint(
                equalTo: scrollContainerView.leadingAnchor,
                constant: AppConstantsConstraints.viewHorizontal
            ),
            bottomViewContainer.trailingAnchor.constraint(
                equalTo: scrollContainerView.trailingAnchor,
                constant: -AppConstantsConstraints.horizontalSkill
            ),
            bottomViewContainer.bottomAnchor.constraint(equalTo: scrollContainerView.bottomAnchor, constant: -10)
        ])
    }
}

// MARK: - CollectionCVViewProtocol

extension CVView: CollectionCVViewProtocol {
    
    func reloadData() {
        middleViewContainer.reloadData()
    }
    
    func buttonChange(image: UIImage?) {
        middleViewContainer.buttonChange(image: image)
    }
    
    func deleteItemsInCollectionView(indexPath: IndexPath) {
        middleViewContainer.deleteItemsInCollectionView(indexPath: indexPath)
    }
    
    var collectionForCell: UICollectionView {
        middleViewContainer.collectionForCell
    }
}
