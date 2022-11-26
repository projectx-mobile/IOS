//
//  FamilyMembersCells.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//
import UIKit

final class FamilysMemberCell: UICollectionViewCell {
    // MARK: User Avatar type
    var avatar: UIButton = {
        let button = AvatarIcon(userName: "", image: UIImage(named: ""))
        button.translatesAutoresizingMaskIntoConstraints = true
        button.isUserInteractionEnabled = false
        return button
    }()
    // MARK: User name title under avatar
    var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .primaryMidnight
        label.font = UIFont(name: "NexaDemo-Bold", size: 12)
        return label
    }()
    // MARK: Cell init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(self.avatar)
        addSubview(self.title)
        constraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: Set cell
extension FamilysMemberCell {
    func setupCell(member: FamilysMember) {
        title.text = member.name
        avatar.setTitle(member.name.first?.uppercased(), for: .normal)
        avatar.setImage(member.avatar, for: .normal)
    }
}
// MARK: Constraints
extension FamilysMemberCell {
        func constraints() {
            title.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 4.5).isActive = true
            avatar.centerXAnchor.constraint(equalTo: title.centerXAnchor).isActive = true
        }
    }
