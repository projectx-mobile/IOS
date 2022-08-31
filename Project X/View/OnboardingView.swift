//
//  ViewController.swift
//  Project X
//
//  Created by anduser on 30.08.2022.
//

import UIKit

class OnboardingView: UIViewController {

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 13)
        label.text = "Рады видеть вас в трекере заданий"
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "NexaDemo-Bold", size: 32)
        label.text = "Выполняй задачи и получай награды "
        return label
    }()
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wsvw375")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        mainSetup()
    }
    
    private func mainSetup() {
        view.backgroundColor = .white
        setupObjectsOnView()
        setupLayoutConstraints()
    }
    
    private func setupObjectsOnView() {
        [welcomeLabel, titleLabel, mainImageView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 18),
            
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 6),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 82),
            
            mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.5),
            mainImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.5),
            mainImageView.heightAnchor.constraint(equalToConstant: 324)
        ])
    }

}

