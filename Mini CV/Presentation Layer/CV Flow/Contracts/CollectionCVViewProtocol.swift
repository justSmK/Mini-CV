//
//  CVViewProtocol.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/19/23.
//

import UIKit.UIView

protocol CollectionCVViewProtocol: UIView {
    
    /// A collection view property used within the conforming view.
    var collectionForCell: UICollectionView { get }
    
    /// Reloads the data of the collection view.
    func reloadData()
    
    /// Changes the button's image within the collection view.
    /// - Parameter image: The new image for the button.
    func buttonChange(image: UIImage?)
    
    /// Deletes items in the collection view at a specified index path.
    /// - Parameter indexPath: The index path of the item to delete.
    func deleteItemsInCollectionView(indexPath: IndexPath)
}
