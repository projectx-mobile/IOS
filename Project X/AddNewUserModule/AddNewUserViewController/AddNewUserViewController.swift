//
//  AddNewUserViewController.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
import UIKit
// MARK: ADD NEW USER DISPLAY
    final class AddNewUserVC: UIViewController {
        var presenter: AddNewUserVCOutputProtocol!
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(label)
            constraints()
            view.backgroundColor = .primaryWhiteSnow
            navigationController?.navigationBar.isHidden = false
        }
        let label: UILabel = {
            let label = SecondaryLabel(text: "ADD NEW USER DISPLAY")
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        private func constraints() {
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
    }


    extension AddNewUserVC: AddNewUserVCInputProtocol {
    }
