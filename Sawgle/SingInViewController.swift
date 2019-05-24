//
//  SingInViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 02/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class SingInViewController: UIViewController {
    
    let singInLogoImageView: UIImageView = {
        let singInLogoImageView = UIImageView()
        singInLogoImageView.image = UIImage(named: "logo")
        return singInLogoImageView
    }()
    
    let signInTitleLabel: UILabel = {
        
        if let titleColor = UIColor(named: "brownishGray") {
            return UILabel().makeTitleLabel(titleText: "회원가입", titleSize: 35, titleColor: titleColor)
        }
        
        return UILabel()
    }()
    
    func makeSingInLogoConstraint() {
        singInLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        singInLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 5).isActive = true
        singInLogoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        singInLogoImageView.widthAnchor.constraint(equalTo: singInLogoImageView.heightAnchor, multiplier: 1.15).isActive = true
        singInLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30).isActive = true
    }
    
    func makeSingInTitleConstraint() {
        signInTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        signInTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signInTitleLabel.topAnchor.constraint(equalTo: singInLogoImageView.bottomAnchor,constant: 10).isActive = true
    }
    
    func prepareSignInView() {
        view.addSubview(singInLogoImageView)
        makeSingInLogoConstraint()
        view.addSubview(signInTitleLabel)
        makeSingInTitleConstraint()
    }
    
    @objc func callParentViewController() {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor(named: "Pale")
        prepareSignInView()
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(callParentViewController))
        swipeGesture.direction = .down
        self.view.addGestureRecognizer(swipeGesture)
    }
}
