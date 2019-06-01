//
//  ViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 02/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class FirstView: UIView {
    
    let panHeartImageView: UIImageView = {
        let panHeartImaveView = UIImageView()
        panHeartImaveView.image = UIImage(named: "PanHeart")
        return panHeartImaveView
    }()
    
    let panImageView: UIImageView = {
        let panImageView = UIImageView()
        panImageView.image = UIImage(named: "Pan")
        return panImageView
    }()
    
    let homeTitleLabel: UILabel = {
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
    
    let loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.backgroundColor = UIColor(named: "Peach")
        loginLabel.clipsToBounds = true
        loginLabel.layer.cornerRadius = 10.0
        loginLabel.font = UIFont().mainFont(displaySize: 24)
        loginLabel.text = "로그인"
        loginLabel.textAlignment = .center
        loginLabel.textColor = UIColor.white
        return loginLabel
    }()
    
    let goSingInViewLabel: UILabel = {
        let goSingInViewLabel = UILabel()
        goSingInViewLabel.backgroundColor = UIColor.clear
        goSingInViewLabel.clipsToBounds = true
        goSingInViewLabel.layer.cornerRadius = 10.0
        goSingInViewLabel.layer.borderWidth = 1.0
        goSingInViewLabel.layer.borderColor = UIColor.white.cgColor
        goSingInViewLabel.font = UIFont().mainFont(displaySize: 24)
        goSingInViewLabel.text = "회원가입"
        goSingInViewLabel.textAlignment = .center
        goSingInViewLabel.textColor = UIColor(named: "brownishGray")
        return goSingInViewLabel
    }()
    
    let gologinViewButton: UIButton = {
        return UIButton()
    }()
    
    let goSingInButton: UIButton = {
        return UIButton()
    }()
    
    func makePanHeartImageViewConstraint() {
        panHeartImageView.translatesAutoresizingMaskIntoConstraints = false
        panHeartImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: -20).isActive = true
        NSLayoutConstraint(item: panHeartImageView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY,
                           multiplier: 0.4,
                           constant: 0.0).isActive = true
        panHeartImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
        panHeartImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
    }
    
    func makePanImageViewConstraint() {
        panImageView.translatesAutoresizingMaskIntoConstraints = false
        panImageView.leadingAnchor.constraint(equalTo: panHeartImageView.trailingAnchor,constant: -5).isActive = true
        NSLayoutConstraint(item: panImageView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: panHeartImageView,
                           attribute: .centerY,
                           multiplier: 0.8,
                           constant: 0.0).isActive = true
        panImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
        panImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.38).isActive = true
        
    }
    
    func makeHomeTitleLabelConstrinat() {
        homeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        homeTitleLabel.topAnchor.constraint(equalTo: self.panHeartImageView.bottomAnchor,constant: 5.0).isActive = true
        homeTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

    }
    
    func makeTwoButtonStackConstraint() {
        twoButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        twoButtonStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        NSLayoutConstraint(item: twoButtonStackView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY,
                           multiplier: 1.5,
                           constant: 0.0).isActive = true
        twoButtonStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 16).isActive = true
        twoButtonStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -16).isActive = true
    }
    
    func makeLoginLabelConstraint() {
        
        loginLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.066).isActive = true
        
    }
    
    func prepareViews() {
        addSubview(panHeartImageView)
        makePanHeartImageViewConstraint()
        
        addSubview(panImageView)
        makePanImageViewConstraint()
        
        addSubview(homeTitleLabel)
        makeHomeTitleLabelConstrinat()
        
        addSubview(twoButtonStackView)
        makeTwoButtonStackConstraint()
    }
    
    func prepareStackView() {
        twoButtonStackView.addArrangedSubview(loginLabel)
        makeLoginLabelConstraint()
        twoButtonStackView.addArrangedSubview(goSingInViewLabel)
        
        addSubview(gologinViewButton)
        gologinViewButton.equalLabelWidthHeight(targetLabel: loginLabel)
        
        addSubview(goSingInButton)
        goSingInButton.equalLabelWidthHeight(targetLabel: goSingInViewLabel)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Pale")
        
        prepareViews()
        prepareStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension UIView {
    
    func equalLabelWidthHeight(targetLabel: UILabel) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: targetLabel.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: targetLabel.heightAnchor).isActive = true
        self.centerXAnchor.constraint(equalTo: targetLabel.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: targetLabel.centerYAnchor).isActive = true
    }
    
}

