//
//  MainTabbarController.swift
//  Project X
//
//  Created by Aliaksey Osipchyk on 2.10.22.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       generateTabBar()
        setupTabBar()
    }
}
// MARK: - Private methods
private extension MainTabBarController {
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: TasksViewController(), image: UIImage(named: "home.notselected"), selectedImage: UIImage(named: "home.selected")),
            generateVC(viewController: WalletViewController(), image: UIImage(named: "wallet.notselected"), selectedImage: UIImage(named: "wallet.selected")),
            generatePlusVC(viewController: AddTaskViewController(), image: UIImage(named: "plusButton"), selectedImage: UIImage(named: "plusButton")),
            generateVC(viewController: RewardsViewController(), image: UIImage(named: "rewards.notselected"), selectedImage: UIImage(named: "rewards.selected")),
            generateVC(viewController: ProfileViewController(), image: UIImage(named: "profile.notselected"), selectedImage: UIImage(named: "profile.selected"))
        ]
    }
    private func generateVC(viewController: UIViewController, image: UIImage?, selectedImage: UIImage?)-> UIViewController {
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectedImage
        viewController.tabBarItem.imageInsets = Constants.barVCImageInsets
        return viewController
    }
    private func generatePlusVC(viewController: UIViewController, image: UIImage?, selectedImage: UIImage?)-> UIViewController {
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectedImage
        viewController.tabBarItem.imageInsets = Constants.barPlusVCImageInsets
        return viewController
    }
    private func setupTabBar() {
        let roundLayer = CAShapeLayer()
        let biezerPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: view.frame.width, height: 86),
        cornerRadius: 10)
        roundLayer.path = biezerPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = 48
        roundLayer.fillColor = Constants.barFillColor
        tabBar.tintColor = .white
    }
}

// MARK: - Constants
private extension MainTabBarController {
    enum Constants {
        static let barPlusVCImageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
        static let barVCImageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -10, right: 0)
        static let barFillColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
    }
}
