//
//  StorageServiceTest.swift
//  Mini CV Tests
//
//  Created by Sergei Semko on 8/18/23.
//

import XCTest
@testable import Mini_CV

final class StorageServiceTest: XCTestCase {
    
    var storageManager: StorageManagerProtocol!
    
    var mockData: MockStructDataArray = [
        .init(string: "Foo"),
        .init(string: "Bar"),
        .init(string: "Baz")
    ]
    
    override func setUp() {
        storageManager = StorageManager()
    }

    override func tearDown() {
        storageManager = nil
    }
    
    func testStorageServiceMemoryLeak() {
        let storageManager = StorageManager()

        let expectation = XCTestExpectation(description: "Waiting for async call")
        
        storageManager.set(mockData, forKey: .skills) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
        let _: MockStructDataArray = storageManager.codableData(forKey: .skills)
        
        trackForMemoryLeak(instance: storageManager)
    }
    
    func testSetObject() {
        let expectation = XCTestExpectation(description: "Waiting for async call")
        
        let setData = mockData
        storageManager.set(setData, forKey: .skills) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
        let getData: MockStructDataArray = storageManager.codableData(forKey: .skills)
        XCTAssertEqual(getData, setData)
    }
    
    func testGetObject() {
        let expectation = XCTestExpectation(description: "Waiting for async call")
        
        storageManager.set(mockData, forKey: .skills) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
        let getData: MockStructDataArray = storageManager.codableData(forKey: .skills)
        XCTAssertNotNil(getData)
        XCTAssertEqual(getData, mockData)
    }

    func testRemoveObject() throws {
        let expectation = XCTestExpectation(description: "Waiting for async call")
        
        storageManager.set(mockData, forKey: .skills) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
        let getData: MockStructDataArray = storageManager.codableData(forKey: .skills)
        storageManager.remove(forKey: .skills)
        let nilData: MockStructDataArray = storageManager.codableData(forKey: .skills)
        XCTAssertNil(nilData)
        XCTAssertNotEqual(getData, nilData)
    }

}
