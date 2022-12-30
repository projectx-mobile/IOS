//
//  UiNavigationController + extension.swift
//  Project X
//
//  Created by Alinser Shchurko on 24.12.22.
//

import UIKit
extension UINavigationController {
    func setNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.backButtonTitle = String()
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "leftChevronFigma")?.withTintColor(.primaryMidnight, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "leftChevronFigma")?.withTintColor(.primaryMidnight, renderingMode: .alwaysOriginal)
    }
}
