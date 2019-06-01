//
//  LoginViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 02/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

enum TextFieldCategory: String {
    case id = "ID"
    case password = "Password"
}

class LoginView: UIView {
    
    let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logo")
        return logoImageView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont().mainFont(displaySize: 60)
        titleLabel.text = "Sawgle"
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    let textFiedlStackView: UIStackView = {
        let textFiedlStackView = UIStackView()
        textFiedlStackView.axis = NSLayoutConstraint.Axis.vertical
        textFiedlStackView.distribution = UIStackView.Distribution.fillEqually
        textFiedlStackView.spacing = 10.0
        return textFiedlStackView
    }()
    
    let idTextField: UITextField  = {
        return UITextField().makeTextField(placeHoldText: "ID")
    }()
    
    let passwordTextField: UITextField = {
        return UITextField().makeTextField(placeHoldText: "Password")
    }()
    
    let loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.backgroundColor = UIColor.white
        loginLabel.clipsToBounds = true
        loginLabel.layer.cornerRadius = 10.0
        loginLabel.font = UIFont().mainFont(displaySize: 24)
        loginLabel.text = "로그인"
        loginLabel.textAlignment = .center
        loginLabel.textColor = UIColor(named: "brownishGray")
        return loginLabel
    }()
    
    let loginButton: UIButton = {
        return UIButton()
    }()
    
    let backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "Back"), for: .normal)
        return backButton
    }()
    
    
    func makeLogoImageViewConstraint() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.17).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor, multiplier: 1.15).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor,constant: 18).isActive = true
        NSLayoutConstraint(item: logoImageView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY,
                           multiplier: 0.6,
                           constant: 0).isActive = true
    }
    
    func makeTitleLabelConstrinat() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor,constant: 0.0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func makeTextFieldStackConstraint() {
        textFiedlStackView.translatesAutoresizingMaskIntoConstraints = false
        textFiedlStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        NSLayoutConstraint(item: textFiedlStackView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY,
                           multiplier: 1.2,
                           constant: 0.0).isActive = true
        textFiedlStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 16).isActive = true
        textFiedlStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -16).isActive = true
    }
    
    func makeIdTextFieldConstraint() {
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
    }
    
    func makeLoginLabelConstraint() {
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.topAnchor.constraint(equalTo: textFiedlStackView.bottomAnchor,constant: 20).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16).isActive = true
        loginLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16).isActive = true
        loginLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.066).isActive = true
    }
    
    func makeLoginButtonConstraint() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.widthAnchor.constraint(equalTo: loginLabel.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalTo: loginLabel.heightAnchor).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: loginLabel.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: loginLabel.centerYAnchor).isActive = true
    }
    
    func makeBackButtionConstraint() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 12),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 16)
            ])

    }
    
    func addViewItem() {
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(textFiedlStackView)
        addSubview(loginLabel)
        addSubview(loginButton)
        addSubview(backButton)
    }
    
    func makeStackView() {
        textFiedlStackView.addArrangedSubview(idTextField)
                textFiedlStackView.addArrangedSubview(passwordTextField)
    }
    
    func makeViewItemConstraint() {
        makeLogoImageViewConstraint()
        makeTitleLabelConstrinat()
        makeTextFieldStackConstraint()
        makeIdTextFieldConstraint()
        makeLoginLabelConstraint()
        makeBackButtionConstraint()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Pale")
        addViewItem()
        makeStackView()
        makeViewItemConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension UITextField {
    
    func makeTextField(placeHoldText: String) -> UITextField {
        
        self.backgroundColor = UIColor(named: "lightPeach")
        self.layer.cornerRadius = 10.0
        self.textAlignment = .center
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        self.attributedPlaceholder = NSAttributedString(string:placeHoldText, attributes: [.foregroundColor: UIColor.white,.font: UIFont.systemFont(ofSize: 20, weight: .regular), .paragraphStyle: paragraphStyle])
    
        guard let category = TextFieldCategory(rawValue: placeHoldText) else {
            return UITextField()
        }
        
        
        switch category {
        case .id:
            self.isSecureTextEntry = false
        case .password:
            self.isSecureTextEntry = true
        }
        
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        self.leftView = leftView
        self.leftViewMode = .always
        
        let newPosition = self.beginningOfDocument
        self.selectedTextRange = self.textRange(from: newPosition, to: newPosition)

        return self
    }
}
