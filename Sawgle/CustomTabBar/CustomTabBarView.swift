//
//  CustomTabBarView.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 27/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class CustomTabBarView: UIView {
    
    var buttonSize: CGFloat = 70
    var buttonBackImageSize: CGFloat = 0
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        return contentView
    }()
    
    let customTabBar: UITabBar = {
        let customTabBar = UITabBar()
        customTabBar.layer.borderWidth = 0
        customTabBar.clipsToBounds = true
        customTabBar.barTintColor = .white
        customTabBar.tintColor = .white
        return customTabBar
    }()
    
    let leftStack: TwoButtonStack = {
        return TwoButtonStack()
    }()
    
    let rightStack: TwoButtonStack = {
        return TwoButtonStack()
    }()
    
    let centerButtonBackImage: UIImageView = {
        return UIImageView()
    }()
    
    let centerButton: UIButton = {
        return UIButton()
    }()
    
    let backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .white
        return backView
    }()
    
    func makeContentViewConstraint() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.heightAnchor.constraint(equalTo: heightAnchor),
            ])
    }
    
    func makeCustomTabBarConstraint() {
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customTabBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -buttonSize),
            customTabBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            customTabBar.centerXAnchor.constraint(equalTo: centerXAnchor),
            customTabBar.widthAnchor.constraint(equalTo: widthAnchor),
            customTabBar.heightAnchor.constraint(equalToConstant: buttonSize)
            ])
        
    }
    
    
    func makeStackConstraint(targetStack: UIView) {
        targetStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            targetStack.widthAnchor.constraint(equalTo: customTabBar.widthAnchor,multiplier: 0.3),
            targetStack.topAnchor.constraint(equalTo: customTabBar.topAnchor,constant: 10)
            ])
    }
    
    func makeLeftStackConstraint() {
        leftStack.leadingAnchor.constraint(equalTo: customTabBar.leadingAnchor,constant: 16).isActive = true
    }
    
    func makeRightStackConstraint() {
        rightStack.trailingAnchor.constraint(equalTo: customTabBar.trailingAnchor,constant: -16).isActive = true
    }
    
    func makeCenterButtonBackImageConstraint() {
        centerButtonBackImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerButtonBackImage.centerXAnchor.constraint(equalTo: customTabBar.centerXAnchor),
            centerButtonBackImage.widthAnchor.constraint(equalToConstant: buttonBackImageSize),
            centerButtonBackImage.heightAnchor.constraint(equalTo: centerButtonBackImage.widthAnchor),
            centerButtonBackImage.topAnchor.constraint(equalTo: customTabBar.topAnchor, constant: -(buttonBackImageSize/2))
            
            ])
    }
    
    func makeCenterButtonConstraint() {
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerButton.centerXAnchor.constraint(equalTo: centerButtonBackImage.centerXAnchor),
            centerButton.centerYAnchor.constraint(equalTo: centerButtonBackImage.centerYAnchor),
            centerButton.widthAnchor.constraint(equalToConstant: buttonSize),
            centerButton.heightAnchor.constraint(equalTo: centerButton.widthAnchor),
            centerButton.topAnchor.constraint(equalTo: customTabBar.topAnchor, constant: -(buttonSize/2))
            
            ])
    }
    
    func makeBackViewConstraint() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backView.centerXAnchor.constraint(equalTo: customTabBar.centerXAnchor),
            backView.centerYAnchor.constraint(equalTo: customTabBar.centerYAnchor),
            backView.widthAnchor.constraint(equalTo: customTabBar.widthAnchor),
            backView.heightAnchor.constraint(equalTo: customTabBar.heightAnchor)
            
            ])
    }
    
    func makeView() {
        backgroundColor = .white
        addSubview(contentView)
        addSubview(customTabBar)
        addSubview(backView)
        
        backView.addSubview(leftStack)
        backView.addSubview(rightStack)
        backView.addSubview(centerButtonBackImage)
        backView.addSubview(centerButton)
    }
    
    func makeItemConstraints() {
        makeContentViewConstraint()
        makeCustomTabBarConstraint()
        makeStackConstraint(targetStack: leftStack)
        makeLeftStackConstraint()
        makeStackConstraint(targetStack: rightStack)
        makeRightStackConstraint()
        makeCenterButtonBackImageConstraint()
        makeCenterButtonConstraint()
        makeBackViewConstraint()
    }
    
    func makeCircleBackButtonImage() {
        centerButtonBackImage.backgroundColor = UIColor(named: "Pale")
        centerButtonBackImage.layer.cornerRadius = buttonBackImageSize / 2
    }
    
    func makeCircleBackButton() {
        centerButton.setImage(UIImage(named: "write"), for: .normal)
        centerButton.layer.cornerRadius = buttonSize / 2
    }
    
    ///버튼의 기본적인 상태를 설정한다.
    func insertDefaultOptionAtButton() {
        
        if let firtButton = leftStack.firstItem as? ButtonStack {
            firtButton.button.setImage(UIImage(named: "home"), for: .normal)
            firtButton.buttonTitle.text = "써글홈"
        }
        if let secondButton = leftStack.secondItem as? ButtonStack {
            secondButton.button.setImage(UIImage(named: "bookmark"), for: .normal)
            secondButton.buttonTitle.text = "즐겨찾기"
        }
        if let thirdButton = rightStack.firstItem as? ButtonStack {
            thirdButton.button.setImage(UIImage(named: "myWrite"), for: .normal)
            thirdButton.buttonTitle.text = "마이글"

        }
        if let fourButton = rightStack.secondItem as? ButtonStack {
            fourButton.button.setImage(UIImage(named: "setting"), for: .normal)
            fourButton.buttonTitle.text = "관리"
        }

    }
    
    
    func makeBackViewLayer() {
        backView.layer.cornerRadius = 15
        backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buttonBackImageSize = buttonSize + 10
        makeView()
        makeItemConstraints()
        insertDefaultOptionAtButton()
        makeCircleBackButtonImage()
        makeCircleBackButton()
        makeBackViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

class TwoButtonStack: UIView {
    
    let twoButtonStackView: UIStackView = {
        let twoButtonStackView = UIStackView()
        twoButtonStackView.axis = .horizontal
        twoButtonStackView.distribution = .fillEqually
        return twoButtonStackView
    }()
    

    let firstItem: UIView = {
        return ButtonStack()
    }()
    
    let secondItem: UIView = {
        return ButtonStack()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(twoButtonStackView)
        
        twoButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            twoButtonStackView.widthAnchor.constraint(equalTo: widthAnchor),
            twoButtonStackView.heightAnchor.constraint(equalTo: heightAnchor),
            twoButtonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            twoButtonStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            ])
        
        twoButtonStackView.addArrangedSubview(firstItem)
        
        twoButtonStackView.addArrangedSubview(secondItem)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
class ButtonStack: UIView {
    
    let buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fill
        return buttonStackView
    }()
    
    let button: UIButton = {
        return UIButton()
    }()
    
    let buttonTitle: UILabel = {
        let firstButtonLabel = UILabel()
        firstButtonLabel.font = UIFont().mainFont(displaySize: 15)
        firstButtonLabel.textColor = #colorLiteral(red: 0.4939999878, green: 0.4199999869, blue: 0.3529999852, alpha: 1)
        firstButtonLabel.contentMode = .center
        firstButtonLabel.textAlignment = .center
        return firstButtonLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(buttonStackView)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.widthAnchor.constraint(equalTo: widthAnchor),
            buttonStackView.heightAnchor.constraint(equalTo: heightAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            ])
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonStackView.addArrangedSubview(button)
        buttonStackView.addArrangedSubview(buttonTitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}


