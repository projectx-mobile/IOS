//
//  ViewController.swift
//  Project X
//
//  Created by anduser on 30.08.2022.
//

import UIKit

class ViewController: UIViewController {

    let button = ButtonForUI(style: .primary, title: "Continue")
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetup()
    }
    func buttonSetup() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 364),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -392),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 56),
            button.widthAnchor.constraint(equalToConstant: 343)
          
        ])
    }

}

