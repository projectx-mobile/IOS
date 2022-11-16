//
//  ProfileRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//

import Foundation
import UIKit
// MARK: Profile protocol
protocol ProfileRouterInputProtocol {
    init(viewController: ProfileViewController)
    func openCustomizeProfile()
    func openEmailSetting()
    func openPasswordSetting()
    func openUserRolesVC()
    func openNotificationsVC()
    func addNewUser()
    func languageSetting()
    func support()
    func openWindowFamilyMember(familyMember: FamilysMember, isParent: Bool)
    func exit()
}
// MARK: ProfileRouter Class
final class ProfileRouter: ProfileRouterInputProtocol {
    unowned let viewController: ProfileViewController
    weak var navigationController: UINavigationController?
    required init(viewController: ProfileViewController) {
        self.viewController = viewController
    }
    // MARK: Open customize profile display
    func openCustomizeProfile() {
        let viewController = CustomizeProfileVC()
        let configurator: CustomizeProfileConfiguratorInputProtocol = CustomizeProfileConfigurator()
        configurator.configure(with: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    // MARK: Open email set display
    func openEmailSetting() {
        let viewController = EmailSettingVC()
        let configurator: EmailSettingConfiguratorInputProtocol = EmailSettingConfigurator()
        configurator.configure(with: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    // MARK: Open password set display
    func openPasswordSetting() {
        let viewController = PasswordSettingVC()
        let configurator: PasswordSettingConfiguratorInputProtocol = PasswordSettingConfigurator()
        configurator.configure(with: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    // MARK: Open user roles display
    func openUserRolesVC() {
        let viewController = UserRolesViewController()
        let configurator: UserRolesConfiguratorInputProtocol = UserRolesConfigurator()
        configurator.configure(with: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    // MARK: Open notification display
    func openNotificationsVC() {
        let viewController = NotificationsVC()
        let configurator: NotificationsConfiguratorInputProtocol = NotificationsConfigurator()
        configurator.configure(with: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    // MARK: Open add new user display
    func addNewUser() {
        let viewController = AddNewUserVC()
        let configurator: AddNewUserConfiguratorInputProtocol = AddNewUserConfigurator()
        configurator.configure(with: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    // MARK: Open language setting display
    func languageSetting() {
        let viewController = LanguageSettingVC()
        let configurator: LanguageSettingConfiguratorInputProtocol = LanguageSettingConfigurator()
        configurator.configure(with: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    // MARK: Open support display
    func support() {
        let viewController = SupportVC()
        let configurator: SupportConfiguratorInputProtocol = SupportConfigurator()
        configurator.configure(with: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    func openWindowFamilyMember(familyMember: FamilysMember, isParent: Bool) {
        let viewController = ModalWindowFamilyMemberVC()
        viewController.familyMember = familyMember
        viewController.profileDelegate = self.viewController
        viewController.isParent = isParent
        viewController.modalPresentationStyle = .overFullScreen
        navigationController?.present(viewController, animated: true) 
    }
    // MARK: Exit func
    func exit() {

    }

}
