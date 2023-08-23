//
//  CVViewProtocol.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/19/23.
//

import UIKit.UIView

protocol CollectionCVViewProtocol: UIView {
    var collectionForCell: UICollectionView { get }
    func reloadData()
    func buttonChange(image: UIImage?)
    func deleteItemsInCollectionView(indexPath: IndexPath)
}
