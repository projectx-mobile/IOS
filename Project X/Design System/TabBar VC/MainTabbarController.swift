//
//  MainTabbarController.swift
//  Project X
//
//  Created by Aliaksey Osipchyk on 2.10.22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
       generateTabBar()
        setupTabBar()
    }
    
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: TasksViewController(), image: UIImage(named: "home.notselected"), selectedImage: UIImage(named: "home.selected")),
            generateVC(viewController: WalletViewController(), image: UIImage(named: "wallet.notselected"), selectedImage: UIImage(named: "wallet.selected")),
            generateVC(viewController: AddTaskViewController(), image: UIImage(named: "plusButton"), selectedImage: UIImage(named: "plusButton")),
            generateVC(viewController: RewardsViewController(), image: UIImage(named: "rewards.notselected"), selectedImage: UIImage(named: "rewards.selected")),
            generateVC(viewController: ProfileViewController(), image: UIImage(named: "profile.notselected"), selectedImage: UIImage(named: "profile.selected"))
        ]
    }
    private func generateVC(viewController: UIViewController, image: UIImage?, selectedImage: UIImage?)-> UIViewController {
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectedImage
        return viewController
    }
    private func setupTabBar() {
        let roundLayer = CAShapeLayer()
        let biezerPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: view.frame.width, height: 86),
        cornerRadius: 10)
        roundLayer.path = biezerPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = 48
        tabBar.itemPositioning = .centered
        roundLayer.fillColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
        tabBar.tintColor = .white
    }
}
