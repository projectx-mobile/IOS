//
//  ChildHomeScreenViewController.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 4.10.22.
//

import UIKit

final class ChildHomeScreenViewController: UIViewController {
    
    var presenter: ChildHomeScreenViewOutputProtocol!
    private let configurator: ChildHomeScreenConfiguratorInputProtocol = ChildHomeScreenConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
}

//MARK: - ChildHomeScreenViewInputProtocol
extension ChildHomeScreenViewController: ChildHomeScreenViewInputProtocol {
}
