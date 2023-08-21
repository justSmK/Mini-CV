//
//  ToastView.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/21/23.
//

import UIKit

final class ToastView: UIView {
    
    // MARK: - Private Properties
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    // MARK: - Initializers
    
    init(message: String) {
        super.init(frame: .zero)
        setupView(message: message)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView(message: String) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        layer.cornerRadius = 15
        clipsToBounds = true
        
        addSubviews(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        label.text = message
    }
    
    private func hideToast(duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = 0.0
        } completion: { _ in
            self.removeFromSuperview()
        }
    }
    
    // MARK: - Internal Methods

    func showToast(on view: UIView, showDuration: TimeInterval = 1.0,
                   hideDuration: TimeInterval = 1.0,
                   displayTime: TimeInterval = 2.0
    ) {
        self.alpha = 0.0
        view.addSubview(self)
        
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        UIView.animate(withDuration: showDuration) {
            self.alpha = 1.0
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + displayTime) {
                self.hideToast(duration: hideDuration)
            }
        }
    }

}
