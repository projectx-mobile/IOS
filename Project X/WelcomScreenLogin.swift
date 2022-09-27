//
//  ViewController.swift
//  Project X
//
//  Created by anduser on 30.08.2022.
//

import UIKit

final class WelcomScreenLogin: UIViewController {
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let createLabel = UILabel()
    let buttonLoginGoogle = CustomLoginButton()
    let buttonLoginApple = CustomLoginButton()
    let buttonLoginMail = CustomLoginButton()
    let createButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
    }
}

