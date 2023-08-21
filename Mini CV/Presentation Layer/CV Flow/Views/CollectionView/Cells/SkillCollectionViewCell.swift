//
//  SkillCollectionViewCell.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/19/23.
//

import UIKit

class SkillCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: SkillCollectionViewCell.self)
    
    private let skillTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
}
