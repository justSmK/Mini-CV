//
//  XCTestCase+Extension.swift
//  Mini CV Tests
//
//  Created by Sergei Semko on 8/23/23.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeak(instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(
                instance,
                "potential memory leak on \(String(describing: instance))",
                file: file,
                line: line
            )
        }
    }
}
