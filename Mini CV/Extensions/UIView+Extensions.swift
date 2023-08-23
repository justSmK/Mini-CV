//
//  UIView+Extensions.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/19/23.
//

import UIKit.UIView

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
