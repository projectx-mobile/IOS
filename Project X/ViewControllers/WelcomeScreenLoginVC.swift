//
//  WelcomeScreenLoginVC.swift
//  Project X
//
//  Created by Dmitriy Eni on 01.09.2022.
//

import UIKit

class WelcomeScreenLoginVC: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - addSubwiews
    
    private func setupUI() {
        
    }
    
}
