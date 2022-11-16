//
//  FamilyMembersCollectionView.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//

import Foundation
import UIKit

final class FamilyCollection: UICollectionView {
    // MARK: Array for  family members parcing
    var familyMembers: [ FamilysMember ] = [ FamilysMember(name: "Иннокентия", avatar: UIImage(named: "")), FamilysMember(name: "Sergey", avatar: UIImage(named: "")), FamilysMember(name: "Volis", avatar: UIImage(named: "boy")) ] {
        didSet { self.reloadData() }
    }
  // MARK: Init for collection view
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 32
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 0)
        super.init(frame: .zero, collectionViewLayout: layout)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .primaryWhiteSnow
        dataSource = self
        delegate = self
        register(FamilysMemberCell.self, forCellWithReuseIdentifier: "FamilysMemberCell")
    }
    // requared init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // delegate for viewcontroller
    weak var delegateProfileVC: ProfileViewControllerInputProtocol?
}
// MARK: Collection view methods
extension FamilyCollection: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        familyMembers.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FamilysMemberCell.self)", for: indexPath)
        as? FamilysMemberCell
        cell?.setupCell(member: familyMembers[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let cell = collectionView.cellForItem(at: indexPath)
        let familyMember = familyMembers[indexPath.row]
        delegateProfileVC?.userInfo(familyMember)
    }
}
