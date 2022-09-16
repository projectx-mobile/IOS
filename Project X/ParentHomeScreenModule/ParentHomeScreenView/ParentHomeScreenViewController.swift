//
//  ParentHomeScreenViewController.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 15.09.22.
//

import UIKit

class ParentHomeScreenViewController: UIViewController, ParentHomeScreenViewInputProtocol {
    
    var presenter: ParentHomeScreenViewOutputProtocol!
    private let configurator: ParentHomeScreenConfiguratorInputProtocol = ParentHomeScreenConfigurator()
    
    private let titleLabel = TitleLabel(text: "Задачи")
    private let activeTasksLabel = SecondaryLabel(text: "Активных на сегодня (0)")
    private let myFamilyLabel = SubtitleLabel(text: "Моя семья")
    private let inviteUsersLabel = SecondaryLabelWithIcon(text: "Пригласить пользователей")
    
    private let idKidsCardTableViewCell = "idKidsCardTableViewCell"
    
    private var contentSizeObservation: NSKeyValueObservation?
    private var tableViewHeightConstraint: NSLayoutConstraint?
    
    var kidsArray:[KidsData] = [KidsData(name: "Alice", numberOfTasks: 1, numberOfTasksDone: 2),
    KidsData(name: "Mike", numberOfTasks: 4, numberOfTasksDone: 2)]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        //tableView.backgroundColor = .primaryWhiteSnow
        tableView.backgroundColor = .purple
        tableView.showsVerticalScrollIndicator = false
        tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delaysContentTouches = false
        tableView.isHidden = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhiteSnow
        setupViews()
        setDelegates()
        setConstraints()
        tableView.register(KidsCardTableViewCell.self, forCellReuseIdentifier: idKidsCardTableViewCell)
        
        contentSizeObservation = tableView.observe(\.contentSize, options: .new, changeHandler: { [weak self] (tv, _) in
            guard let self = self else { return }
            self.tableViewHeightConstraint!.constant = tv.contentSize.height
        })
    }
    
    deinit {
        contentSizeObservation?.invalidate()
    }
}

//MARK: - Private extension
extension ParentHomeScreenViewController {
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(activeTasksLabel)
        view.addSubview(myFamilyLabel)
        view.addSubview(inviteUsersLabel)
        view.addSubview(tableView)
        inviteUsersLabel.isHidden = true
        checkNumberOfKids()
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func checkNumberOfKids() {
        if kidsArray.count == 0 {
            tableView.isHidden = true
            inviteUsersLabel.isHidden = false
        } else {
            tableView.isHidden = false
            inviteUsersLabel.isHidden = true
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 84),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            activeTasksLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            activeTasksLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            activeTasksLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            myFamilyLabel.topAnchor.constraint(equalTo: activeTasksLabel.bottomAnchor, constant: 29),
            myFamilyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            myFamilyLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            inviteUsersLabel.topAnchor.constraint(equalTo: myFamilyLabel.bottomAnchor, constant: 9),
            inviteUsersLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            inviteUsersLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: myFamilyLabel.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.5),
           // tableView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 20)
        NSLayoutConstraint.activate([tableViewHeightConstraint!])
    }
}

//MARK: - UITableViewDataSource

extension ParentHomeScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kidsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idKidsCardTableViewCell, for: indexPath) as! KidsCardTableViewCell
        cell.cellConfigure(data: kidsArray)
        return cell
    }
}

//MARK: - UITableViewDelegate

extension ParentHomeScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
