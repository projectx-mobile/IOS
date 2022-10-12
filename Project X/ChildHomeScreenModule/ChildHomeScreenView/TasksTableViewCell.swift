//
//  TasksTableViewCell.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 12.10.22.
//

import UIKit

final class TasksTableViewCell: UITableViewCell {
    
    private let backgroundCell:UIView = {
        let view = UIView()
        view.backgroundColor = .statusOverdue
        view.layer.cornerRadius = LayoutConstants.cornerRadius10
        view.layer.borderWidth = LayoutConstants.borderWidth
        view.layer.borderColor = UIColor.primaryMidnight.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Название задачи"
        label.font = UIFont.nexaDemoBold14()
        label.textColor = .primaryMidnight
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func cellConfigure(data:KidsUpdates) {
//        updateLabel.text = "\(data.name) \(data.update.rawValue)"
//    }
}

//MARK: - Private extension
private extension TasksTableViewCell {
    func setupViews() {
        selectionStyle = .none
        backgroundCell.addSmallShadowOnView()
        addSubview(backgroundCell)
        addSubview(titleLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -LayoutConstants.inset2),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -LayoutConstants.inset10)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: LayoutConstants.inset14),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: LayoutConstants.inset16),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -LayoutConstants.inset16)
        ])
    }
}
