//
//  ViewController.swift
//  Project X
//
//  Created by anduser on 30.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.169, green: 0.176, blue: 0.2, alpha: 1)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.424, green: 0.431, blue: 0.517, alpha: 1)
        return label
    }()
    
    private let createLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.169, green: 0.176, blue: 0.2, alpha: 1)
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let button1: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let button2: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - addSubwiews
    
    private func setupUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "NexaDemo-Bold", size: 32)
        titleLabel.text = "Войти"
        view.addSubview(titleLabel)
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.font = UIFont(name: "Roboto-Regular", size: 14)
        subTitleLabel.text = "Выбери способ доступа в свой аккаунт."
        view.addSubview(subTitleLabel)
        
        createLabel.translatesAutoresizingMaskIntoConstraints = false
        createLabel.font = UIFont(name: "Roboto-Regular", size: 14)
        createLabel.text = "Впервые в Трекере Заданий? Создать аккаунт."
        createLabel.numberOfLines = 0
        view.addSubview(createLabel)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 0
        button.layer.shadowOffset = CGSize(width: 2.5, height: 3)
        button.layer.backgroundColor = UIColor(red: 0.491, green: 0.271, blue: 1, alpha: 1).cgColor
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1.4
        button.layer.borderColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
        view.addSubview(button)
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.layer.shadowColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
        button1.layer.shadowOpacity = 1
        button1.layer.shadowRadius = 0
        button1.layer.shadowOffset = CGSize(width: 2.5, height: 3)
        button1.layer.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.984, alpha: 1).cgColor
        button1.layer.cornerRadius = 8
        button1.layer.borderWidth = 1.4
        button1.layer.borderColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
        view.addSubview(button1)
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.layer.shadowColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
        button2.layer.shadowOpacity = 1
        button2.layer.shadowRadius = 0
        button2.layer.shadowOffset = CGSize(width: 2.5, height: 3)
        button2.layer.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.984, alpha: 1).cgColor
        button2.layer.cornerRadius = 8
        button2.layer.borderWidth = 1.4
        button2.layer.borderColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
        view.addSubview(button2)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            createLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            createLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            createLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            
            button1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button1.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 48),
            button1.heightAnchor.constraint(equalToConstant: 48),
            
            button2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button2.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 112),
            button2.heightAnchor.constraint(equalToConstant: 48),
            
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 216),
            button.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

