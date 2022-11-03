//
//  WelcomeViewController.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import UIKit

class WelcomeViewController: UIViewController {

    var presenter: WelcomeViewOutputProtocol!
    private let configurator: WelcomeConfiguratorInputProtocol = WelcomeConfigurator()
    
    private let welcomeTitleLabel = WelcomeTitleLabel(text: "Рады видеть тебя в трекере заданий Alfredo")
    
    private let collectionView = WelcomeCollectionView()
    private let pageView1 = PageControlItem()
    private let pageView2 = PageControlItem()
    
    var timer: Timer?
    var currentCellIndex = 0

    private lazy var logInButton: UIButton = {
        let button = PrimaryButton(text: "Войти", fillColor: .primaryWhiteSnow, tintColor: .primaryMidnight, borderColor: .primaryMidnight)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var signUpButton: UIButton = {
        let button = PrimaryButton(text: "Создать аккаунт", fillColor: .primaryJuicyGrape, tintColor: .primaryPureWhite, borderColor: .primaryMidnight)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()

    private var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundGrey
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let comeBackView = ComeBackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .primaryPureWhite

        setupViews()
        setConstraints()
        addSwipe()
        setupCollection()
        startTimer()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToAnotherIndex))
        view.addGestureRecognizer(tap)
    }
}

// MARK: - Private extension
private extension WelcomeViewController {
    func setupViews() {
        view.addSubview(signUpButton)
        view.addSubview(logInButton)
        view.addSubview(backgroundView)
        backgroundView.isHidden = true
        view.addSubview(comeBackView)
        pageView1.backgroundColor = .primaryJuicyGrape
        view.addSubview(welcomeTitleLabel)
        view.addSubview(collectionView)
    }
    
    func setupCollection() {
        collectionView.setCells(cells: WelcomeCellModel.fetchWelcomeModel())
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
    }
    
     func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextIndex() {
        if currentCellIndex < 1 {
            currentCellIndex += 1
            pageView1.backgroundColor = .primaryPureWhite
            pageView2.backgroundColor = .primaryJuicyGrape
        } else {
            currentCellIndex -= 1
            pageView1.backgroundColor = .primaryJuicyGrape
            pageView2.backgroundColor = .primaryPureWhite
        }
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @objc func tapToAnotherIndex() {
        if currentCellIndex < 1 {
            currentCellIndex += 1
            pageView1.backgroundColor = .primaryPureWhite
            pageView2.backgroundColor = .primaryJuicyGrape
        } else {
            currentCellIndex -= 1
            pageView1.backgroundColor = .primaryJuicyGrape
            pageView2.backgroundColor = .primaryPureWhite
        }
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        timer?.invalidate()
    }

    func addSwipe() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(doSwipe))
        swipe.direction = .down
        swipe.numberOfTouchesRequired = 1
        comeBackView.isUserInteractionEnabled = true
        comeBackView.addGestureRecognizer(swipe)
    }

    @objc func doSwipe() {
        UIView.animate(withDuration: 1) {
            self.comeBackView.frame = CGRect(x: 0,
                                             y: UIScreen.main.bounds.size.height,
                                             width: self.comeBackView.frame.width,
                                             height: self.comeBackView.frame.height)
        }
        self.backgroundView.isHidden = true
    }

    @objc func signUpButtonTapped() {
    }

    @objc func logInButtonTapped() {
        UIView.animate(withDuration: 1) {
            self.comeBackView.frame = CGRect(x: 0,
                                             y: (UIScreen.main.bounds.size.height - self.comeBackView.frame.height),
                                             width: self.comeBackView.frame.width,
                                             height: self.comeBackView.frame.height)
        }
        self.backgroundView.isHidden = false
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            signUpButton.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -LayoutConstants.inset16),
            signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset16),
            signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset16),
            signUpButton.heightAnchor.constraint(equalToConstant: LayoutConstants.height48)
        ])

        NSLayoutConstraint.activate([
            logInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -LayoutConstants.inset58),
            logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset16),
            logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset16),
            logInButton.heightAnchor.constraint(equalToConstant: LayoutConstants.height48)
        ])

        NSLayoutConstraint.activate([
            comeBackView.topAnchor.constraint(equalTo: view.bottomAnchor),
            comeBackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            comeBackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            comeBackView.heightAnchor.constraint(equalToConstant: LayoutConstants.height371)
        ])

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            welcomeTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 68),
            welcomeTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            welcomeTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            welcomeTitleLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: welcomeTitleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 429)
        ])
        
     let controlStack: UIStackView = {
        let controlStack = UIStackView(arrangedSubviews: [
            pageView1, pageView2
        ])
        controlStack.axis = .horizontal
        controlStack.spacing = 8.0
        controlStack.alignment = .center
        controlStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controlStack)
        return controlStack
    }()
        NSLayoutConstraint.activate([
            controlStack.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            controlStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
