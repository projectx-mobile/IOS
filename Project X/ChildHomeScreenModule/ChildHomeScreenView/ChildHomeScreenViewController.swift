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
    
    private let titleLabel = TitleLabel(text: "Задачи")
    private let activeTasksLabel = SecondaryLabel(text: "Активных на сегодня (0)")
    private let notificationView = NotificationView()
    private let noNotificationView = NoNotificationView()
    private let calendarView = CalendarView()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .primaryJuicyGrape
        view.layer.cornerRadius = LayoutConstants.cornerRadius10
        view.layer.borderWidth = LayoutConstants.borderWidth
        view.layer.borderColor = UIColor.primaryMidnight.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .primaryWhiteSnow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .primaryWhiteSnow
        view.layer.cornerRadius = LayoutConstants.cornerRadius10
        view.layer.shadowColor = UIColor.someGray.cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: LayoutConstants.shadowOffsetWidth0, height: -LayoutConstants.shadowOffsetHeight2)
        view.layer.shadowOpacity = LayoutConstants.shadowOpacity1
        view.layer.shadowRadius = LayoutConstants.shadowRadius0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let separatorUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .lavanderGrey
        view.layer.cornerRadius = LayoutConstants.cornerRadius3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let allTasksButton = TaskDescriptionButton(text: "все")
    private let newTasksButton = TaskDescriptionButton(text: "новые")
    private let doneTasksButton = TaskDescriptionButton(text: "готовы")
    private let descendingTasksButton = TaskDescriptionButton(text: "по убыванию баллов")
    
    private var tasksButtonsStackView = UIStackView()
    
    private let tasksTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .primaryWhiteSnow
        tableView.showsVerticalScrollIndicator = false
        tableView.bounces = false
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delaysContentTouches = false
        return tableView
    }()
    
    private var numberOfNotifications = 0 {
        didSet {
            setUpNotificationView()
        }
    }
    
    private var textOfNotification = ""
    
    private var tasksTableViewHeightConstraint: NSLayoutConstraint?
    
    private var contentSizeTasksTableViewObservation: NSKeyValueObservation?
    
    private let idTasksTableViewCell = "idTasksTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhiteSnow
        setupViews()
        setConstraints()
        setDelegates()
        
        tasksTableView.register(TasksTableViewCell.self, forCellReuseIdentifier: idTasksTableViewCell)
        
        contentSizeTasksTableViewObservation = tasksTableView.observe(\.contentSize, options: .new, changeHandler: { [weak self] (tv, _) in
            guard let self = self else { return }
            if tv.contentSize.height > LayoutConstants.initialHeight1000 {
                self.tasksTableViewHeightConstraint!.constant = tv.contentSize.height
            }
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        checkNumberOfNotifications()
    }
    
    deinit {
        contentSizeTasksTableViewObservation?.invalidate()
    }
}

//MARK: - Private extension
private extension ChildHomeScreenViewController {
    
    func setupViews() {
        backgroundView.transform = backgroundView.transform.rotated(by: CGFloat(-0.05))
        [backgroundView, titleLabel, activeTasksLabel, notificationView, noNotificationView, calendarView, containerView].forEach { view.addSubview($0) }
        tasksButtonsStackView = UIStackView(arrangedSubviews: [allTasksButton, newTasksButton, doneTasksButton, descendingTasksButton])
        tasksButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        tasksButtonsStackView.distribution = .fill
        tasksButtonsStackView.alignment = .center
        tasksButtonsStackView.spacing = LayoutConstants.spacing8
        allTasksButton.addTarget(self, action: #selector(allTasksButtonPressed), for: .touchUpInside)
        newTasksButton.addTarget(self, action: #selector(newTasksButtonPressed), for: .touchUpInside)
        doneTasksButton.addTarget(self, action: #selector(doneTasksButtonPressed), for: .touchUpInside)
        descendingTasksButton.addTarget(self, action: #selector(descendingTasksButtonPressed), for: .touchUpInside)
        [separatorView, separatorUnderView, tasksButtonsStackView, tasksTableView].forEach { containerView.addSubview($0) }
    }
    
    func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = .clear
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    func checkNumberOfNotifications() {
        presenter.getNumberOfNotifications()
        setUpNotificationView()
    }
    
    func setUpNotificationView() {
        if numberOfNotifications == 0 {
            notificationView.isHidden = true
            noNotificationView.isHidden = false
            backgroundView.isHidden = true
        } else if numberOfNotifications == 1{
            backgroundView.isHidden = true
            notificationView.isHidden = false
            noNotificationView.isHidden = true
            noNotificationView.isHidden = true
            presenter.getTextOfNotification()
            notificationView.configureWithText(text: textOfNotification)
        } else {
            backgroundView.isHidden = false
            notificationView.isHidden = false
            noNotificationView.isHidden = true
            presenter.getTextOfNotification()
            notificationView.configureWithText(text: textOfNotification)
        }
    }
    
    func setDelegates() {
        notificationView.closeDelegate = self
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
    }
    
    @objc private func allTasksButtonPressed() {
        [newTasksButton, doneTasksButton, descendingTasksButton].forEach { button in
            button.setTitleColor(.primaryMidnight, for: .normal)
            button.backgroundColor = .primaryWhiteSnow
        }
    }
    
    @objc private func newTasksButtonPressed() {
        [allTasksButton, doneTasksButton, descendingTasksButton].forEach { button in
            button.setTitleColor(.primaryMidnight, for: .normal)
            button.backgroundColor = .primaryWhiteSnow
        }
    }
    
    @objc private func doneTasksButtonPressed() {
        [newTasksButton, allTasksButton, descendingTasksButton].forEach { button in
            button.setTitleColor(.primaryMidnight, for: .normal)
            button.backgroundColor = .primaryWhiteSnow
        }
    }
    
    @objc private func descendingTasksButtonPressed() {
        [newTasksButton, allTasksButton, doneTasksButton].forEach { button in
            button.setTitleColor(.primaryMidnight, for: .normal)
            button.backgroundColor = .primaryWhiteSnow
        }
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: LayoutConstants.inset76),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset16)
        ])
        
        NSLayoutConstraint.activate([
            activeTasksLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutConstants.inset8),
            activeTasksLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset16),
            activeTasksLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset16)
        ])
        
        NSLayoutConstraint.activate([
            notificationView.topAnchor.constraint(equalTo: activeTasksLabel.bottomAnchor, constant: LayoutConstants.inset40),
            notificationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset16),
            notificationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset16),
            notificationView.heightAnchor.constraint(equalToConstant: LayoutConstants.height64)
        ])
        
        NSLayoutConstraint.activate([
            noNotificationView.topAnchor.constraint(equalTo: activeTasksLabel.bottomAnchor, constant: LayoutConstants.inset40),
            noNotificationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset16),
            noNotificationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset16),
            noNotificationView.heightAnchor.constraint(equalToConstant: LayoutConstants.height64)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: notificationView.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor, constant: -LayoutConstants.inset14),
            backgroundView.widthAnchor.constraint(equalTo: notificationView.widthAnchor, constant: -LayoutConstants.inset32),
            backgroundView.heightAnchor.constraint(equalToConstant: LayoutConstants.height60)
        ])
        
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: LayoutConstants.inset16),
            calendarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -LayoutConstants.inset16),
            calendarView.topAnchor.constraint(equalTo: noNotificationView.bottomAnchor,constant: LayoutConstants.inset16),
            calendarView.heightAnchor.constraint(equalToConstant: LayoutConstants.height121)
        ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: LayoutConstants.inset40),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: tasksTableView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: containerView.topAnchor),
            separatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: LayoutConstants.inset20)
        ])
        
        NSLayoutConstraint.activate([
            separatorUnderView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: LayoutConstants.inset10),
            separatorUnderView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            separatorUnderView.widthAnchor.constraint(equalToConstant: LayoutConstants.width42),
            separatorUnderView.heightAnchor.constraint(equalToConstant: LayoutConstants.height5)
        ])
        
        NSLayoutConstraint.activate([
            tasksButtonsStackView.topAnchor.constraint(equalTo: separatorUnderView.bottomAnchor, constant: LayoutConstants.inset27),
            tasksButtonsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: LayoutConstants.inset16),
            tasksButtonsStackView.widthAnchor.constraint(lessThanOrEqualTo: containerView.widthAnchor, constant: -LayoutConstants.inset32),
            tasksButtonsStackView.heightAnchor.constraint(equalToConstant: LayoutConstants.height32)
        ])
        
        tasksTableViewHeightConstraint = tasksTableView.heightAnchor.constraint(equalToConstant: LayoutConstants.initialHeight1000)
        NSLayoutConstraint.activate([tasksTableViewHeightConstraint!])
        
        NSLayoutConstraint.activate([
            tasksTableView.topAnchor.constraint(equalTo: tasksButtonsStackView.bottomAnchor, constant: LayoutConstants.inset24),
            tasksTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: LayoutConstants.inset16),
            tasksTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -LayoutConstants.inset16)
        ])
    }
}

//MARK: - CloseProtocol
extension ChildHomeScreenViewController: CloseProtocol{
    func closeButtonTapped() {
        presenter.deleteFirstNotification()
    }
}

//MARK: - ChildHomeScreenViewInputProtocol
extension ChildHomeScreenViewController: ChildHomeScreenViewInputProtocol {
    func receiveNumberOfNotifications(number: Int) {
        numberOfNotifications = number
    }
    
    func receiveTextOfNotification(text: String) {
        textOfNotification = text
    }
}

//MARK: - UITableViewDataSource
extension ChildHomeScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idTasksTableViewCell, for: indexPath) as! TasksTableViewCell
        //            presenter.getInfoForUpdatesCell(at: indexPath)
        //            if let cellinfo = cellUpdatesInfo {
        //                cell.cellConfigure(data: cellinfo)
        //            }
        //            cell.accessoryType = .disclosureIndicator
        return cell
    }
}


//MARK: - UITableViewDelegate
extension ChildHomeScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return LayoutConstants.rowHeight84
    }
}
