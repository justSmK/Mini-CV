//
//  MockStruct.swift
//  Mini CV Tests
//
//  Created by Sergei Semko on 8/18/23.
//

import Foundation

typealias MockStructDataArray = [MockStructData]?

struct MockStructData: Codable, Equatable {
    let string: String
}
