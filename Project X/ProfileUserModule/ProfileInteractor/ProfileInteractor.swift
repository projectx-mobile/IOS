//
//  ProfileInteractor.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//

import Foundation

protocol ProfileInteractorProtocol: AnyObject {
}
class ProfileInteractor {
    weak var presenter: ProfilePresenterProtocol?
}
extension ProfileInteractor: ProfileInteractorProtocol {
}
