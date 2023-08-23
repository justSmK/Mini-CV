//
//  String+Extensions.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/23/23.
//

import Foundation

extension String {
    var localized: Self {
        return NSLocalizedString(self, comment: "")
    }
}
