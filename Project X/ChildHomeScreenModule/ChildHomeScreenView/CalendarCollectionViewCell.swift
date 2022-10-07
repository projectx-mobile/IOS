//
//  CalendarCollectionViewCell.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 6.10.22.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    private let dayOfWeekLabel:UILabel = {
        let label = UILabel()
        label.text = "Ср"
        label.font = .robotoMedium11()
        label.textColor  = .primaryMidnight
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfDayLabel:UILabel = {
        let label = UILabel()
        label.text = "29"
        label.font = .robotoMedium14()
        label.textColor  = .primaryMidnight
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .accentStatusNew
            } else {
                backgroundColor = .primaryWhiteSnow
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        layer.cornerRadius = LayoutConstants.cornerRadius8
        layer.borderWidth = LayoutConstants.borderWidth
        layer.borderColor = UIColor.primaryMidnight.cgColor

        addSubview(dayOfWeekLabel)
        addSubview(numberOfDayLabel)
    }
    
    func cellConfigure(numberOfDay: String, dayOfWeek: String){
        numberOfDayLabel.text = numberOfDay
        dayOfWeekLabel.text = dayOfWeek
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstants.inset10)
        ])
        
        NSLayoutConstraint.activate([
            numberOfDayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberOfDayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -LayoutConstants.inset10)
        ])
    }
}
