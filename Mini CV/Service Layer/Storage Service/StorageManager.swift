//
//  StorageManager.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/18/23.
//

import Foundation

final class StorageManager {
    enum Keys: String {
        case skills
    }
    
    private let userDefaults = UserDefaults.standard
    
    private func store(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }
    
    private func restore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
    
    private func remove(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
}

extension StorageManager: StorageManagerProtocol {
    func set<T: Encodable>(_ object: T?, forKey key: Keys) {
        let data = try? JSONEncoder().encode(object)
        store(data, key: key.rawValue)
    }
    
    func codableData<T: Decodable>(forKey key: Keys) -> T? {
        guard let data = restore(forKey: key.rawValue) as? Data else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    func remove(forKey key: Keys) {
        remove(forKey: key.rawValue)
    }
    
    
}