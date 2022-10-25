//
//  ParentUpdatesViewController.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 29.09.22.
//

// swiftlint:disable force_cast

import UIKit

final class ParentUpdatesViewController: UIViewController {
    var presenter: ParentUpdatesViewOutputProtocol!

    private let idUpdatesTableViewCell = "idUpdatesTableViewCell"

    private let updatesTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .primaryWhiteSnow
        tableView.showsVerticalScrollIndicator = false
        tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delaysContentTouches = false
        return tableView
    }()

    private var numberOfUpdatesCells = 0
    private var cellUpdatesInfo: KidsUpdates?

    override func viewDidLoad() {
        title = Constants.title
        super.viewDidLoad()
        view.backgroundColor = .primaryWhiteSnow
        setupViews()
        setDelegates()
        setConstraints()
        setupNavigationBar()
        updatesTableView.register(UpdatesTableViewCell.self, forCellReuseIdentifier: idUpdatesTableViewCell)
        setupNavigationBar()
    }
}

// MARK: - Private extension
private extension ParentUpdatesViewController {

    func setupViews() {
        view.addSubview(updatesTableView)
    }

    func setDelegates() {
        updatesTableView.delegate = self
        updatesTableView.dataSource = self
    }

    func setupNavigationBar() {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithTransparentBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.primaryMidnight]
            navBarAppearance.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9843137255, alpha: 1).withAlphaComponent(0.8)

            let scrollnavBarAppearance = UINavigationBarAppearance()
            scrollnavBarAppearance.configureWithOpaqueBackground()
            scrollnavBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.primaryWhiteSnow]
            scrollnavBarAppearance.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9843137255, alpha: 1)

            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = scrollnavBarAppearance

            let backButton = UIBarButtonItem()
            backButton.title = ""
            backButton.tintColor = .primaryMidnight
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            updatesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            updatesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset18),
            updatesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset18),
            updatesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}

// MARK: - Private extension
private extension ParentUpdatesViewController {
    enum Constants {
        static let title = "Обновления"
    }
}

// MARK: - UITableViewDataSource
extension ParentUpdatesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getNumberOfUpdatesCells()
        return numberOfUpdatesCells
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idUpdatesTableViewCell, for: indexPath) as! UpdatesTableViewCell
        presenter.getInfoForUpdatesCell(at: indexPath)
        if let cellinfo = cellUpdatesInfo {
            cell.cellConfigure(data: cellinfo)
        }
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 60))

        let label = TitleLabel(text: "Обновления")
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width, height: headerView.frame.height-10)
        headerView.addSubview(label)
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

// MARK: - UITableViewDelegate
extension ParentUpdatesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return LayoutConstants.rowHeight66
    }
}

// MARK: - ParentUpdatesViewInputProtocol
extension ParentUpdatesViewController: ParentUpdatesViewInputProtocol {

    func receiveNumberOfUpdatesCells(number: Int) {
        numberOfUpdatesCells = number
    }

    func receiveInfoForUpdatesCells(info: KidsUpdates) {
        cellUpdatesInfo = info
    }
}
