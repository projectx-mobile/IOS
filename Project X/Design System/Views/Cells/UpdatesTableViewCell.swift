//
//  UpdatesTableViewCell.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//


import UIKit

final class UpdatesTableViewCell: UITableViewCell {
    
    private let backgroundCell:UIView = {
        let view = UIView()
        view.backgroundColor = .accentStatus
        view.layer.cornerRadius = LayoutConstants.cornerRadius8
        view.layer.borderWidth = LayoutConstants.borderWidth
        view.layer.borderColor = UIColor.primaryMidnight.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let updateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.robotoRegular14()
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
    
    func cellConfigure(data:KidsUpdates) {
        updateLabel.text = "\(data.name) \(data.update.rawValue)"
    }
}

//MARK: - Private extension
private extension UpdatesTableViewCell {
    func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
       
        addSubview(backgroundCell)
        addSubview(updateLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstants.inset5),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -LayoutConstants.inset5)
        ])
        
        NSLayoutConstraint.activate([
            updateLabel.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            updateLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: LayoutConstants.inset16)
        ])
    }
}
