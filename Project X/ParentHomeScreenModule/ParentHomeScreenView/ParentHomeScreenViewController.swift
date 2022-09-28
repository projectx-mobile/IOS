//
//  ParentHomeScreenViewController.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//


import UIKit

class ParentHomeScreenViewController: UIViewController, ParentHomeScreenViewInputProtocol {

    var presenter: ParentHomeScreenViewOutputProtocol!
    private let configurator: ParentHomeScreenConfiguratorInputProtocol = ParentHomeScreenConfigurator()
    
    private let titleLabel = TitleLabel(text: "Задачи")
    private let activeTasksLabel = SecondaryLabel(text: "Активных на сегодня (0)")
    private let inviteUsersLabel = SecondaryLabelWithIcon(text: "Пригласить пользователей")
    private let updatesLabel = SubtitleLabel(text: "Обновления")
    private let seeAllLabel = SecondaryLabelWithIcon(text: "Смотреть все")
    private let noUpdatesLabel = SecondaryLabel(text: "Пока здесь пусто.")
    
    let noKidsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noKids")
        imageView.bounds.size = CGSize(width: LayoutConstants.width85, height: LayoutConstants.height78)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let noUpdatesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noUpdates")
        imageView.bounds.size = CGSize(width: LayoutConstants.width167, height: LayoutConstants.height152)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let idKidsCardTableViewCell = "idKidsCardTableViewCell"
    private let idUpdatesTableViewCell = "idUpdatesTableViewCell"
    
    private var contentSizeObservation: NSKeyValueObservation?
    private var tableViewHeightConstraint: NSLayoutConstraint?

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
        tableView.backgroundColor = .primaryWhiteSnow
        tableView.showsVerticalScrollIndicator = false
        tableView.bounces = false
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delaysContentTouches = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhiteSnow
        setupViews()
        seeAllLabel.font = .robotoRegular13()
        setDelegates()
        setConstraints()
        
        kidsTableView.register(KidsCardTableViewCell.self, forCellReuseIdentifier: idKidsCardTableViewCell)
        
        contentSizeObservation = kidsTableView.observe(\.contentSize, options: .new, changeHandler: { [weak self] (tv, _) in
            guard let self = self else { return }
            if tv.contentSize.height > LayoutConstants.initialHeight220 {
                self.tableViewHeightConstraint!.constant = tv.contentSize.height
            }
        })
        
        updatesTableView.register(UpdatesTableViewCell.self, forCellReuseIdentifier: idUpdatesTableViewCell)
    }
    
    deinit {
        contentSizeObservation?.invalidate()
    }
    
    private var numberOfKidsCells = 0
    private var numberOfUpdatesCells = 0
    private var cellKidsInfo: KidsData?
    private var cellUpdatesInfo: KidsUpdates?
    
    func receiveNumberOfKidsCells(number: Int) {
        numberOfKidsCells = number
    }
    
    func receiveNumberOfUpdatesCells(number: Int) {
        numberOfUpdatesCells = number
    }
    
    func receiveInfoForKidsCells(info: KidsData) {
        cellKidsInfo = info
    }
    
    func receiveInfoForUpdatesCells(info: KidsUpdates) {
        cellUpdatesInfo = info
    }
}

//MARK: - Private extension
extension ParentHomeScreenViewController {
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(activeTasksLabel)
        view.addSubview(inviteUsersLabel)
        view.addSubview(noKidsImageView)
        view.addSubview(kidsTableView)
        view.addSubview(containerView)
        containerView.addSubview(separatorView)
        containerView.addSubview(updatesLabel)
        containerView.addSubview(seeAllLabel)
        containerView.addSubview(noUpdatesLabel)
        containerView.addSubview(updatesTableView)
        containerView.addSubview(noUpdatesImageView)
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
        presenter.getNumberOfKidsCells()
        if numberOfKidsCells == 0 {
            kidsTableView.isHidden = true
            noKidsImageView.isHidden = false
            inviteUsersLabel.isHidden = false
        } else {
            kidsTableView.isHidden = false
            noKidsImageView.isHidden = true
            inviteUsersLabel.isHidden = true
        }
    }
    
    private func checkUpdates() {
        presenter.getNumberOfUpdatesCells()
        if numberOfUpdatesCells == 0 {
            updatesTableView.isHidden = true
            seeAllLabel.isHidden = true
            noUpdatesLabel.isHidden = false
            noUpdatesImageView.isHidden = false
        } else {
            updatesTableView.isHidden = false
            seeAllLabel.isHidden = false
            noUpdatesLabel.isHidden = true
            noUpdatesImageView.isHidden = true
        }
    }
    
    private func setConstraints() {
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
            noKidsImageView.topAnchor.constraint(equalTo: activeTasksLabel.bottomAnchor, constant: LayoutConstants.inset52),
            noKidsImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            inviteUsersLabel.topAnchor.constraint(equalTo: noKidsImageView.bottomAnchor, constant: LayoutConstants.inset14),
            inviteUsersLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])

        NSLayoutConstraint.activate([
            kidsTableView.topAnchor.constraint(equalTo: activeTasksLabel.bottomAnchor, constant: LayoutConstants.inset24),
            kidsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.inset16),
            kidsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutConstants.inset16),
        ])
        
        tableViewHeightConstraint = kidsTableView.heightAnchor.constraint(equalToConstant: LayoutConstants.initialHeight220)
        NSLayoutConstraint.activate([tableViewHeightConstraint!])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: kidsTableView.bottomAnchor, constant: LayoutConstants.inset30),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: containerView.topAnchor),
            separatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: LayoutConstants.inset20)
        ])
        
        NSLayoutConstraint.activate([
            updatesLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: LayoutConstants.inset8),
            updatesLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: LayoutConstants.inset16),
        ])
        
        NSLayoutConstraint.activate([
            seeAllLabel.centerYAnchor.constraint(equalTo: updatesLabel.centerYAnchor),
            seeAllLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -LayoutConstants.inset16)
        ])
        
        NSLayoutConstraint.activate([
            noUpdatesLabel.topAnchor.constraint(equalTo: updatesLabel.bottomAnchor, constant: LayoutConstants.inset8),
            noUpdatesLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: LayoutConstants.inset16)
        ])
        
        NSLayoutConstraint.activate([
            noUpdatesImageView.topAnchor.constraint(equalTo: noUpdatesLabel.bottomAnchor, constant: LayoutConstants.inset24),
            noUpdatesImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            updatesTableView.topAnchor.constraint(equalTo: updatesLabel.bottomAnchor, constant: LayoutConstants.inset19),
            updatesTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: LayoutConstants.inset16),
            updatesTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -LayoutConstants.inset16),
            updatesTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -LayoutConstants.inset24)
        ])
    }
}

//MARK: - UITableViewDataSource
extension ParentHomeScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == kidsTableView  {
            presenter.getNumberOfKidsCells()
            return numberOfKidsCells
        } else {
            presenter.getNumberOfUpdatesCells()
            return numberOfUpdatesCells
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == kidsTableView  {
            let cell = tableView.dequeueReusableCell(withIdentifier: idKidsCardTableViewCell, for: indexPath) as! KidsCardTableViewCell
            presenter.getInfoForKidsCell(at: indexPath)
            if let cellinfo = cellKidsInfo {
                cell.cellConfigure(data: cellinfo)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: idUpdatesTableViewCell, for: indexPath) as! UpdatesTableViewCell
            presenter.getInfoForUpdatesCell(at: indexPath)
            if let cellinfo = cellUpdatesInfo {
                cell.cellConfigure(data: cellinfo)
            }
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
}

//MARK: - UITableViewDelegate
extension ParentHomeScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == kidsTableView {
            return LayoutConstants.rowHeight80
        } else {
            return LayoutConstants.rowHeight66
        }
    }
}
