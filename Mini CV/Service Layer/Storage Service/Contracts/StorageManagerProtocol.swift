//
//  StorageManagerProtocol.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

// CRUD: Create, Read, Update, Delete

protocol StorageManagerProtocol {
    // MARK: Create, Update
    
    /// Sets the value for the specified key.
    /// - Parameters:
    ///   - object:  An object corresponding to `Encodable` to be saved.
    ///   - key: The key by which the object is saved.
    ///   - completion: Completion block, called after saving.
    func set<T: Encodable>(_ object: T?, forKey key: StorageManager.Keys, completion: @escaping () -> Void)
    
    // MARK: Read
    
    /// Returns the decoded object for the specified key.
    /// - Parameter key: The key by which the object is extracted.
    /// - Returns: The decoded object, or `nil` if there is none.
    func codableData<T: Decodable>(forKey key: StorageManager.Keys) -> T?
    
    // MARK: Delete
    
    /// Deletes the value for the specified key.
    /// - Parameter key: The key by which the value is deleted.
    func remove(forKey key: StorageManager.Keys)
}
