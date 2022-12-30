//
//  InviteUserByEmailVc.swift
//  Project X
//
//  Created by Alinser Shchurko on 22.12.22.
//
import UIKit
import Lottie
final class EmailUserInviteVc: UIViewController {
    // MARK: Constant
    var presenter: EmailUserInviteVcOutputProtocol?
    private var isValid: Bool = false
    // MARK: Labels
    private let emailInviteLabel = TitleLabel(text: "Пригласить по email")
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Email нового пользователя"
        label.textColor = .duskGrey
        label.font = UIFont.robotoRegular12()
        label.frame = CGRect(x: LayoutConstants.inset16, y: LayoutConstants.inset10, width: LayoutConstants.width160, height: LayoutConstants.height15)
        label.isHidden = true
        return label
    }()
    // Animation label
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Приглашение отправлено"
        label.font = .nexaDemoBold12()
        label.textColor = .primaryMidnight
        label.textAlignment = .center
        let labelHeight = LayoutConstants.height14
        label.frame = CGRect(x: LayoutConstants.inset0, y: (animationView.frame.height - labelHeight), width: animationView.frame.width, height: labelHeight)
        return label
    }()
    // MARK: Buttons
    private let parentRadioButton: UIButton = {
        let button = RadioButton(text: "Родитель")
        button.addTarget(self, action: #selector(radioButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    private lazy var sentInviteButton: PrimarySecondaryButton = {
        let button = PrimarySecondaryButton(title: "Отправить приглашение")
        button.addTarget(self, action: #selector(sentInviteAction), for: .touchUpInside)
        return button
    }()
    private let childRadioButton: UIButton = {
        let button = RadioButton(text: "Ребенок")
        button.addTarget(self, action: #selector(radioButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    // MARK: Views
    private lazy var radioButtonsStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.parentRadioButton, self.childRadioButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = LayoutConstants.inset16
        stackView.alignment = .leading
        return stackView
    }()
    // Animation view
    private let animationView: AnimationView = {
        let animationView = AnimationView()
        let sizeAnimationView = (UIScreen.main.bounds.width - LayoutConstants.inset132)
        animationView.frame = CGRect(x: LayoutConstants.inset66, y: LayoutConstants.inset112, width: sizeAnimationView, height: sizeAnimationView)
        animationView.animation = .named("sent")
        animationView.play()
        return animationView
    }()
    // Invite was senting view
    private lazy var wasSentAnimationView: UIView = {
        let view = UIView()
        let layer1 = CALayer()
        layer1.backgroundColor = UIColor.primaryWhiteSnow.cgColor
        layer1.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.backgroundColor = .black
        view.layer.addSublayer(layer1)
        view.addSubview(animationView)
        return view
    }()
    private let emailTextField: UITextField = {
        let textField = CustomTextField(placehold: "Email нового пользователя")
        textField.addTarget(self, action: #selector(emailTextFieldAction), for: .editingChanged)
        return textField
    }()
    // MARK: Hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    // MARK: System methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhiteSnow
        navigationController?.navigationBar.topItem?.backButtonTitle = String()
        addView()
        constraints()
        emailTextField.delegate = self
    }
}
// MARK: Actions
private extension EmailUserInviteVc {
    // Radio button action
    @objc func radioButtonAction(sender: UIButton) {
        switch sender {
        case self.parentRadioButton:
            self.parentRadioButton.isSelected = true
            self.childRadioButton.isSelected = false
        case self.childRadioButton:
            self.childRadioButton.isSelected = true
            self.parentRadioButton.isSelected = false
        default: break
        }
        self.emailTextFieldAction()
    }
    // Email textfield action
    @objc func emailTextFieldAction() {
        let isEmpty = (emailTextField.text?.isEmpty ?? true)
        switch isEmpty {
        case true:
            self.emailTextField.contentVerticalAlignment = .center
            self.placeholderLabel.isHidden = true
            self.sentInviteButton.isSelected = false
        case false:
            if !self.parentRadioButton.isSelected && !self.childRadioButton.isSelected {
                self.emailTextField.contentVerticalAlignment = .bottom
                self.placeholderLabel.isHidden = false
                self.sentInviteButton.isSelected = false
            } else if self.parentRadioButton.isSelected || self.childRadioButton.isSelected {
                self.emailTextField.contentVerticalAlignment = .bottom
                self.placeholderLabel.isHidden = false
                self.sentInviteButton.isSelected = true
            }
        }
    }
    // Sent invite action
    @objc func sentInviteAction() {
        view.endEditing(true)
        self.animationView.addSubview(messageLabel)
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(wasSentAnimationView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5 ) { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.presenter?.toRouter()
        }
    }
}
// MARK: Custom methods
private extension EmailUserInviteVc {
    func addView() {
        view.addSubview(emailInviteLabel)
        view.addSubview(radioButtonsStack)
        view.addSubview(emailTextField)
        view.addSubview(sentInviteButton)
        emailTextField.addSubview(placeholderLabel)
    }
}
// MARK: Constraints
private extension EmailUserInviteVc {
    func constraints() {
        NSLayoutConstraint.activate([
            // Title Label screen
            self.emailInviteLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.inset16),
            self.emailInviteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.inset16),
            self.emailInviteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutConstants.inset16),
            // Radio button stack
            self.radioButtonsStack.topAnchor.constraint(equalTo: emailInviteLabel.bottomAnchor, constant: LayoutConstants.inset40),
            self.radioButtonsStack.leadingAnchor.constraint(equalTo: emailInviteLabel.leadingAnchor),
            // TextField
            self.emailTextField.topAnchor.constraint(equalTo: self.radioButtonsStack.bottomAnchor, constant: LayoutConstants.inset24),
            self.emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.inset16),
            self.emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutConstants.inset16),
            self.emailTextField.heightAnchor.constraint(equalToConstant: LayoutConstants.height56),
            // Sent invition button
            self.sentInviteButton.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: LayoutConstants.inset48),
            self.sentInviteButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.sentInviteButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.sentInviteButton.heightAnchor.constraint(equalToConstant: LayoutConstants.height56)
        ])
    }
}
// MARK: Delegate for TextField
extension EmailUserInviteVc: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.sublayers?.forEach { layerItem in
            if layerItem.name == "Shadow" {
                layerItem.removeFromSuperlayer()
            }
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.innerShadowForView(to: [.left, .top], radius: 5.4, opacity: 1, color: UIColor(red: 0.58, green: 0.61, blue: 0.76, alpha: 1.0).cgColor, name: "Shadow")
    }
}
extension EmailUserInviteVc: EmailUserInviteVcInputProtocol {
}
