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
    
    private let taskConditionImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "today")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let taskConditionLabel: UILabel = {
        let label = UILabel()
        label.text = "Сегодня"
        label.font = UIFont.robotoRegular12()
        label.textColor = .primaryMidnight
        label.numberOfLines = 1
        return label
    }()
    
    private var taskConditionStackView = UIStackView()
    
    private let taskPointsImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "points")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let taskPointsLabel: UILabel = {
        let label = UILabel()
        label.text = "0 баллов"
        label.font = UIFont.robotoRegular12()
        label.textColor = .primaryMidnight
        label.numberOfLines = 1
        return label
    }()
    
    private var taskPointsStackView = UIStackView()
    
    private let taskDoneImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "notDone")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private extension
private extension TasksTableViewCell {
    func setupViews() {
        selectionStyle = .none
        backgroundCell.addSmallShadowOnView()
        addSubview(backgroundCell)
        addSubview(titleLabel)
        taskConditionStackView = UIStackView(arrangedSubviews: [taskConditionImageView, taskConditionLabel])
        taskConditionStackView.translatesAutoresizingMaskIntoConstraints = false
        taskConditionStackView.distribution = .fill
        taskConditionStackView.alignment = .center
        taskConditionStackView.spacing = LayoutConstants.spacing6
        addSubview(taskConditionStackView)
        taskPointsStackView = UIStackView(arrangedSubviews: [taskPointsImageView, taskPointsLabel])
        taskPointsStackView.translatesAutoresizingMaskIntoConstraints = false
        taskPointsStackView.distribution = .fill
        taskPointsStackView.alignment = .center
        taskPointsStackView.spacing = LayoutConstants.spacing6
        addSubview(taskPointsStackView)
        addSubview(taskDoneImageView)
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
        
        NSLayoutConstraint.activate([
            taskConditionStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutConstants.inset8),
            taskConditionStackView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: LayoutConstants.inset18),
            taskConditionImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.width20),
            taskConditionImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.height20)
        ])
        
        NSLayoutConstraint.activate([
            taskPointsStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutConstants.inset8),
            taskPointsStackView.leadingAnchor.constraint(equalTo: taskConditionStackView.trailingAnchor, constant: LayoutConstants.inset18),
            taskPointsImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.width20),
            taskPointsImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.height20)
        ])
        
        NSLayoutConstraint.activate([
            taskDoneImageView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            taskDoneImageView.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -LayoutConstants.inset25),
            taskDoneImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.width24),
            taskDoneImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.height24)
        ])
    }
}
