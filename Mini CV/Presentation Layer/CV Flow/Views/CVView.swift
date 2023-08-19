//
//  CVView.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/19/23.
//

import UIKit

final class CVView: UIView {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .always
        return scrollView
    }()
    
    private let fillerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColors.gray
        return view
    }()
    
    private let scrollContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    private let topViewContainer = TopViewContainer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDelegate(delegate: UIScrollViewDelegate) {
        scrollView.delegate = delegate
    }
}

private extension CVView {
    func setupLayout() {
        self.addSubviews(
            fillerView,
            scrollView
        )
        scrollView.addSubview(scrollContainerView)
        scrollContainerView.addSubview(topViewContainer)
    }
    
    func setupConstraints() {
        let scrollContentLayoutGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            fillerView.topAnchor.constraint(equalTo: self.topAnchor),
            fillerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            fillerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            fillerView.bottomAnchor.constraint(greaterThanOrEqualTo: scrollContainerView.topAnchor),
            
            scrollContainerView.topAnchor.constraint(equalTo: scrollContentLayoutGuide.topAnchor),
            scrollContainerView.leadingAnchor.constraint(equalTo: scrollContentLayoutGuide.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollContentLayoutGuide.trailingAnchor),
            scrollContainerView.bottomAnchor.constraint(equalTo: scrollContentLayoutGuide.bottomAnchor),
            
            scrollContainerView.heightAnchor.constraint(equalToConstant: 1000),
            scrollContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            topViewContainer.topAnchor.constraint(equalTo: scrollContainerView.topAnchor),
            topViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            topViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
