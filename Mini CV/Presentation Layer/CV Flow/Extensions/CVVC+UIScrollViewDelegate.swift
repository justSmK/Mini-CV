//
//  CVVC+UIScrollViewDelegate.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/19/23.
//

import UIKit.UIScrollView

extension CVViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= -50 {
            navigationController?.navigationBar.topItem?.title = MockData.shared.viewControllerTitle
        } else {
            navigationController?.navigationBar.topItem?.title = nil
        }
    }
}
