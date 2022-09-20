//
//  UpdatesTableViewCell.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 19.09.22.
//

import UIKit

class UpdatesTableViewCell: UITableViewCell {
    
    private let backgroundCell:UIView = {
        let view = UIView()
        view.backgroundColor = .accentStatus
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1.4
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
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
       
        addSubview(backgroundCell)
        addSubview(updateLabel)
    }
    
    func cellConfigure(data:KidsUpdates) {
        updateLabel.text = "\(data.name) \(data.update.rawValue)"
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            updateLabel.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            updateLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 16)
        ])
    }
}
