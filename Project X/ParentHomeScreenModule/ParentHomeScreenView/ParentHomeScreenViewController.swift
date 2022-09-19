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
    private let updatesLabel = SubtitleLabel(text: "Обновления")
    private let seeAllLabel = SecondaryLabelWithIcon(text: "Смотреть все")
    private let noUpdatesLabel = SecondaryLabel(text: "Пока здесь пусто.")
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .primaryWhiteSnow
        view.layer.cornerRadius = 10.0
        view.layer.shadowColor = UIColor.someGray.cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: -2.0)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let idKidsCardTableViewCell = "idKidsCardTableViewCell"
    private let idUpdatesTableViewCell = "idUpdatesTableViewCell"
    
    private var contentSizeObservation: NSKeyValueObservation?
    private var tableViewHeightConstraint: NSLayoutConstraint?
    
    var kidsArray:[KidsData] = [KidsData(name: "Alice", numberOfTasks: 2, numberOfTasksDone: 1),
    KidsData(name: "Mike", numberOfTasks: 4, numberOfTasksDone: 3), KidsData(name: "Harry", numberOfTasks: 8, numberOfTasksDone: 3)]
    
    var kidsUpdates:[KidsUpdates] = [KidsUpdates(name: "Mike", update: .created), KidsUpdates(name: "Alice", update: .completed)]

    private let kidsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .primaryWhiteSnow
        tableView.showsVerticalScrollIndicator = false
        tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delaysContentTouches = false
        return tableView
    }()
    
    private let updatesTableView: UITableView = {
        let tableView = UITableView()
        //tableView.backgroundColor = .primaryWhiteSnow
        tableView.backgroundColor = .lightGray

        tableView.showsVerticalScrollIndicator = false
        tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delaysContentTouches = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhiteSnow
        setupViews()
        setDelegates()
        setConstraints()
        kidsTableView.register(KidsCardTableViewCell.self, forCellReuseIdentifier: idKidsCardTableViewCell)
        
        contentSizeObservation = kidsTableView.observe(\.contentSize, options: .new, changeHandler: { [weak self] (tv, _) in
            guard let self = self else { return }
            self.tableViewHeightConstraint!.constant = tv.contentSize.height
        })
        
        updatesTableView.register(UpdatesTableViewCell.self, forCellReuseIdentifier: idUpdatesTableViewCell)
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
        view.addSubview(kidsTableView)
        view.addSubview(separatorView)
        view.addSubview(updatesLabel)
        view.addSubview(seeAllLabel)
        view.addSubview(noUpdatesLabel)
        view.addSubview(updatesTableView)
        checkNumberOfKids()
        checkUpdates()
    }
    
    private func setDelegates() {
        kidsTableView.delegate = self
        kidsTableView.dataSource = self
        updatesTableView.delegate = self
        updatesTableView.dataSource = self
    }
    
    private func checkNumberOfKids() {
        if kidsArray.count == 0 {
            kidsTableView.isHidden = true
            inviteUsersLabel.isHidden = false
        } else {
            kidsTableView.isHidden = false
            inviteUsersLabel.isHidden = true
        }
    }
    
    private func checkUpdates() {
        if kidsUpdates.count == 0 {
            updatesTableView.isHidden = true
            seeAllLabel.isHidden = true
            noUpdatesLabel.isHidden = false
        } else {
            updatesTableView.isHidden = false
            seeAllLabel.isHidden = false
            noUpdatesLabel.isHidden = true
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
            kidsTableView.topAnchor.constraint(equalTo: myFamilyLabel.bottomAnchor, constant: 5),
            kidsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.5),
            kidsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.5),
        ])
        
        tableViewHeightConstraint = kidsTableView.heightAnchor.constraint(equalToConstant: 20)
        NSLayoutConstraint.activate([tableViewHeightConstraint!])
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: kidsTableView.bottomAnchor, constant: 20),
            separatorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            updatesLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 8),
            updatesLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            seeAllLabel.centerYAnchor.constraint(equalTo: updatesLabel.centerYAnchor),
            seeAllLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            noUpdatesLabel.topAnchor.constraint(equalTo: updatesLabel.bottomAnchor, constant: 8),
            noUpdatesLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            updatesTableView.topAnchor.constraint(equalTo: updatesLabel.bottomAnchor, constant: 14),
            updatesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            updatesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            updatesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24)
        ])
    }
}

//MARK: - UITableViewDataSource

extension ParentHomeScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == kidsTableView  {
            return kidsArray.count
        } else {
            return kidsUpdates.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == kidsTableView  {
            let cell = tableView.dequeueReusableCell(withIdentifier: idKidsCardTableViewCell, for: indexPath) as! KidsCardTableViewCell
            cell.cellConfigure(data: kidsArray[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: idUpdatesTableViewCell, for: indexPath) as! UpdatesTableViewCell
            return cell
        }
    }
}

//MARK: - UITableViewDelegate

extension ParentHomeScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == kidsTableView {
            return 80.0
        } else {
            return 66.0
        }
    }
}
