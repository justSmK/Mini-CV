//
//  LeftAlignedCollectionViewFlowLayout.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/21/23.
//

import UIKit

final class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        self.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        self.minimumInteritemSpacing = AppConstantsSizes.CollectionView.spaceBetweenSkills
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        
        attributes?.forEach({ layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            
            layoutAttribute.frame.origin.x = leftMargin
            
            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY, maxY)
        })
        
        return attributes
    }
}
