//
//  SkillsCollectionView.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/21/23.
//

import UIKit

final class SkillsCollectionView: UICollectionView {
    
    private let leftAlignedFlowLayout = LeftAlignedCollectionViewFlowLayout()
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: leftAlignedFlowLayout)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.register(
            SkillCollectionViewCell.self,
            forCellWithReuseIdentifier: SkillCollectionViewCell.identifier
        )
        
        self.register(
            AddSkillCollectionViewCell.self,
            forCellWithReuseIdentifier: AddSkillCollectionViewCell.identifier
        )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard !CGSizeEqualToSize(bounds.size, intrinsicContentSize) else {
            return
        }
        
        invalidateIntrinsicContentSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
