//
//  CalendarView.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 6.10.22.
//

import UIKit

final class CalendarView: UIView {
    private let todayLabel: UILabel = {
        let label = UILabel()
        label.text = "Сегодня"
        label.textColor = .primaryMidnight
        label.font = .nexaDemoBold12()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let monthLabel: UILabel = {
        let label = UILabel()
        label.text = "Июнь"
        label.textColor = .primaryMidnight
        label.font = .nexaDemoBold12()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .primaryMidnight
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .clear
        datePicker.tintColor = .primaryJuicyGrape
        datePicker.preferredDatePickerStyle = .compact
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        return datePicker
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "left")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .duskGrey
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var forwardButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "right")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .duskGrey
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(forwardButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let idCalendarCell = "idCalendarCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        setDelegates()
        
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func forwardButtonTapped() {
        print("forwardButtonTapped")
    }
    
    @objc private func backButtonTapped() {
        print("backButtonTapped")
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
           let dateFormatter: DateFormatter = DateFormatter()
           dateFormatter.dateFormat = "E-dd"
           let selectedDate: String = dateFormatter.string(from: sender.date)
           print("Selected value \(selectedDate)")
        print("here i need to change cell date")
       }
}

//MARK: - Private extension
private extension CalendarView {
    func setupViews() {
        backgroundColor = .primaryPureWhite
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = LayoutConstants.cornerRadius10
        layer.borderWidth = LayoutConstants.borderWidth
        layer.borderColor = UIColor.lavanderGrey.cgColor
        addSubview(todayLabel)
        addSubview(monthLabel)
        addSubview(calendarImageView)
        addSubview(datePicker)
        datePicker.paintClear()
        addSubview(backButton)
        addSubview(forwardButton)
        addSubview(collectionView)
    }
    
    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            todayLabel.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstants.inset21),
            todayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.inset40)
        ])
        
        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstants.inset21),
            monthLabel.trailingAnchor.constraint(equalTo: calendarImageView.leadingAnchor, constant: -LayoutConstants.inset11)
        ])
        
        NSLayoutConstraint.activate([
            calendarImageView.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstants.inset19),
            calendarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -LayoutConstants.inset43),
            calendarImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.height18),
            calendarImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.width18)
        ])

        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: calendarImageView.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: calendarImageView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstants.inset74),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.inset13),
            backButton.heightAnchor.constraint(equalToConstant: LayoutConstants.height10),
            backButton.widthAnchor.constraint(equalToConstant: LayoutConstants.width5)
        ])
        
        NSLayoutConstraint.activate([
            forwardButton.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstants.inset74),
            forwardButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -LayoutConstants.inset13),
            forwardButton.heightAnchor.constraint(equalToConstant: LayoutConstants.height10),
            forwardButton.widthAnchor.constraint(equalToConstant: LayoutConstants.width5)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: LayoutConstants.inset17),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.inset40),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -LayoutConstants.inset16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -LayoutConstants.inset40)
            ])
    }
}

//MARK: - UICollectionViewDelegate
extension CalendarView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension CalendarView: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/6,
               height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        LayoutConstants.cellsOffset8
    }
}

//MARK: - UICollectionViewDataSource
extension CalendarView: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        LayoutConstants.numberOfCalendarCells5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as! CalendarCollectionViewCell
        cell.cellConfigure(numberOfDay: "15", dayOfWeek: "Вт")
        return cell
    }
}


