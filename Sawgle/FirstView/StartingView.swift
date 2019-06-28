//
//  ViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 02/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class StartingView: UIView {
    let panHeartImageView: UIImageView = {
        let panHeartImageView = UIImageView()
        panHeartImageView.image = UIImage(named: "PanHeart")
        return panHeartImageView
    }()
    
    let panImageView: UIImageView = {
        let panImageView = UIImageView()
        panImageView.image = UIImage(named: "Pan")
        return panImageView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont().mainFont(displaySize: 80)
        titleLabel.text = "Sawgle"
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    let twoButtonStackView: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = NSLayoutConstraint.Axis.vertical
        buttonStack.distribution = UIStackView.Distribution.fillEqually
        buttonStack.spacing = 20.0
        return buttonStack
    }()
    
    let signInLabel: UILabel = {
        let signInLabel = UILabel()
        signInLabel.backgroundColor = UIColor(named: "Peach")
        signInLabel.clipsToBounds = true
        signInLabel.layer.cornerRadius = 10.0
        signInLabel.font = UIFont().mainFont(displaySize: 24)
        signInLabel.text = "로그인"
        signInLabel.textAlignment = .center
        signInLabel.textColor = UIColor.white
        return signInLabel
    }()
    
    let signUpLabel: UILabel = {
        let signUpLabel = UILabel()
        signUpLabel.backgroundColor = UIColor.clear
        signUpLabel.clipsToBounds = true
        signUpLabel.layer.cornerRadius = 10.0
        signUpLabel.layer.borderWidth = 1.0
        signUpLabel.layer.borderColor = UIColor.white.cgColor
        signUpLabel.font = UIFont().mainFont(displaySize: 24)
        signUpLabel.text = "회원가입"
        signUpLabel.textAlignment = .center
        signUpLabel.textColor = UIColor(named: "brownishGray")
        return signUpLabel
    }()
    
    let signInButton: UIButton = {
        UIButton()
    }()
    
    let signUpButton: UIButton = {
        UIButton()
    }()
    
    func makePanHeartImageViewConstraint() {
        self.panHeartImageView.translatesAutoresizingMaskIntoConstraints = false
        self.panHeartImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: -20).isActive = true
        NSLayoutConstraint(item: self.panHeartImageView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY,
                           multiplier: 0.4,
                           constant: 0.0).isActive = true
        self.panHeartImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
        self.panHeartImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
    }
    
    func makePanImageViewConstraint() {
        self.panImageView.translatesAutoresizingMaskIntoConstraints = false
        self.panImageView.leadingAnchor.constraint(equalTo: self.panHeartImageView.trailingAnchor, constant: -5).isActive = true
        NSLayoutConstraint(item: self.panImageView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self.panHeartImageView,
                           attribute: .centerY,
                           multiplier: 0.8,
                           constant: 0.0).isActive = true
        self.panImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
        self.panImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.38).isActive = true
    }
    
    func makeTitleLabelConstrinat() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: self.panHeartImageView.bottomAnchor, constant: 5.0).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func makeTwoButtonStackConstraint() {
        self.twoButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        self.twoButtonStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        NSLayoutConstraint(item: self.twoButtonStackView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY,
                           multiplier: 1.5,
                           constant: 0.0).isActive = true
        self.twoButtonStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        self.twoButtonStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }
    
    func makeSignInLabelConstraint() {
        self.signInLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.066).isActive = true
    }
    
    func addViewItemInStartingView() {
        addSubview(self.panHeartImageView)
        addSubview(self.panImageView)
        addSubview(self.titleLabel)
        addSubview(self.twoButtonStackView)
        addSubview(self.signInButton)
        addSubview(self.signUpButton)
    }
    
    func addViewContraintInStartingView() {
        self.makePanHeartImageViewConstraint()
        self.makePanImageViewConstraint()
        self.makeTitleLabelConstrinat()
        self.makeTwoButtonStackConstraint()
    }
    
    func addStackViewItemInStartingView() {
        self.twoButtonStackView.addArrangedSubview(self.signInLabel)
        self.twoButtonStackView.addArrangedSubview(self.signUpLabel)
    }
    
    func addStackViewConstraintInStaringView() {
        self.makeSignInLabelConstraint()
        self.signInButton.addEqualLabelSizeConstraint(targetLabel: self.signInLabel)
        self.signUpButton.addEqualLabelSizeConstraint(targetLabel: self.signUpLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Pale")
        self.addViewItemInStartingView()
        self.addStackViewItemInStartingView()
        
        self.addViewContraintInStartingView()
        self.addStackViewConstraintInStaringView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension UIView {
    func addEqualLabelSizeConstraint(targetLabel: UILabel) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: targetLabel.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: targetLabel.heightAnchor).isActive = true
        self.centerXAnchor.constraint(equalTo: targetLabel.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: targetLabel.centerYAnchor).isActive = true
    }
}
