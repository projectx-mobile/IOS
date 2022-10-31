//
//  WelcomeCollectionViewCell.swift
//  Project X
//
//  Created by Александра Захаревич on 31.10.22.
//

import UIKit
import Lottie

 final class WelcomeCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "WelcomeCollectionViewCell"
    
     let welcomeSubtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
         label.font = .nexaDemoBold32()//  .systemFont(ofSize: 25) // в проекте должно быть 32
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.74 //  в проекте должно быть 0.74
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     var animationView = AnimationView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupAnimation()
        
        welcomeSubtitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        welcomeSubtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.5).isActive = true
        welcomeSubtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.5).isActive = true
        welcomeSubtitleLabel.widthAnchor.constraint(equalToConstant: 343).isActive = true
        
        animationView.topAnchor.constraint(equalTo: welcomeSubtitleLabel.bottomAnchor, constant: 32).isActive = true
        animationView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        animationView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 325).isActive = true
        
//        welcomeSubtitleLabel.backgroundColor = .white
//        animationView.backgroundColor = .yellow
//        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WelcomeCollectionViewCell {
    func setup(_ model: WelcomeCellModel) {
        welcomeSubtitleLabel.text = model.subtitle
        animationView.animation = .named(model.animationName)
        animationView.play()
    }
}

private extension WelcomeCollectionViewCell {
    func setupViews() {
        addSubview(welcomeSubtitleLabel)
    }

    func setupAnimation(){
        animationView.backgroundColor = .primaryPureWhite
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(animationView)

    }
 }
