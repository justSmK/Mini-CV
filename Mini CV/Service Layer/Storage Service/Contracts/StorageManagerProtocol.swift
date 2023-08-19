//
//  StorageManagerProtocol.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

// CRUD: Create, Read, Update, Delete

protocol StorageManagerProtocol {
    // MARK: Create, Update
//    func set(_ object: Any?, forKey key: StorageManager.Keys)
    func set<T: Encodable>(_ object: T?, forKey key: StorageManager.Keys)
    
    // MARK: Read
    func codableData<T: Decodable>(forKey key: StorageManager.Keys) -> T?
    
    // MARK: Delete
    func remove(forKey key: StorageManager.Keys)
}
