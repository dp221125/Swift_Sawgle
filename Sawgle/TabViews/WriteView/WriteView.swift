//
//  WriteViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 27/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class WriteView: UIView {
    
    var menuViewHeight: CGFloat = 44.0
    
    let menuView: UIView = {
        let menuView = UIView()
        menuView.backgroundColor = UIColor(named: "Pale")
        return menuView
    }()
    
    let bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = .white
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 30
        bottomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return bottomView
    }()
    
    let leftButton: UIButton = {
        let leftButton = UIButton().makeSideButton(title: "취소")
         leftButton.setTitleColor(UIColor(named: "brownishGray"), for: .normal)
        return leftButton
    }()
    
    let rightButton: UIButton = {
        let rightButton = UIButton().makeSideButton(title: "써글")
        rightButton.setTitleColor(UIColor(named: "brownishGray"), for: .normal)
        return rightButton
    }()
    
    let logoImageView: UIImageView = {
        return UIView().makeLogoView()
    }()
    
  
    
    func makeMenuViewConstraint() {
        menuView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo:topAnchor),
            menuView.widthAnchor.constraint(equalTo: widthAnchor),
            menuView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: menuViewHeight),
            menuView.heightAnchor.constraint(equalToConstant: menuViewHeight),
            menuView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
    
    func makeButtonConstarint(targetButton: UIButton) {
        
        targetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            targetButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            targetButton.heightAnchor.constraint(equalTo: logoImageView.heightAnchor),
            targetButton.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor)

            ])
    }
    
    func makeLogoViewConstraint() {
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: menuViewHeight - 10),
            logoImageView.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: menuViewHeight / 2)
            ])
    }
    
    func makeBottomViewConstraint() {
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: menuView.bottomAnchor),
            bottomView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
            
            ])
    }
    
    func addViewItem() {
        addSubview(menuView)
        addSubview(leftButton)
        addSubview(logoImageView)
        addSubview(rightButton)
        addSubview(bottomView)
    }
    
    func makeViewItemConstraint() {
        
        makeMenuViewConstraint()
        makeLogoViewConstraint()
        makeButtonConstarint(targetButton: leftButton)
        makeButtonConstarint(targetButton: rightButton)

        leftButton.leadingAnchor.constraint(equalTo: menuView.leadingAnchor,constant: 16).isActive = true
        rightButton.trailingAnchor.constraint(equalTo: menuView.trailingAnchor,constant: -16).isActive = true
        
        makeBottomViewConstraint()
    }
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.9215686275, blue: 0.8235294118, alpha: 1)
        
        addViewItem()
        makeViewItemConstraint()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    

}
extension UIButton {
    
    func makeSideButton(title: String) -> UIButton {
        let leftButton = UIButton()
        leftButton.setTitle(title, for: .normal)
        leftButton.titleLabel?.font = UIFont(name: "S-CoreDream-4Regular", size: 17)
        return leftButton
    }
}

