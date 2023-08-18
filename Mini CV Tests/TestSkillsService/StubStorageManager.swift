//
//  StubStorageManager.swift
//  Mini CV Tests
//
//  Created by Sergei Semko on 8/18/23.
//

import Foundation
@testable import Mini_CV

class StubStorageManager: StorageManagerProtocol {
    
    private var storage = [Mini_CV.StorageManager.Keys: Data]()
    
    func set<T>(_ object: T?, forKey key: Mini_CV.StorageManager.Keys) where T : Encodable {
        guard let object else {
            storage[key] = nil
            return
        }
        let data = try? JSONEncoder().encode(object)
        storage[key] = data
    }
    
    func codableData<T>(forKey key: Mini_CV.StorageManager.Keys) -> T? where T : Decodable {
        guard let data = storage[key] else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    func remove(forKey key: Mini_CV.StorageManager.Keys) {
        storage[key] = nil
    }
}
