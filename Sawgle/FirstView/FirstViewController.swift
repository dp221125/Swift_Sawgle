//
//  FirstViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 24/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @objc func callLoginViewController() {
        let loginVC = LoginViewController()
        
        self.present(loginVC,animated: true)
    }
    
    @objc func callSingInViewController() {
        let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
        let signInVC = storyBoard.instantiateViewController(withIdentifier: "NewRegisterVC")
        
        self.present(signInVC, animated: true)
    }
    
    func linkActionInFirstView() {
        
        guard let ownView = view as? FirstView else {
            return
        }
        
        ownView.gologinViewButton.addTarget(self, action: #selector(callLoginViewController), for: .touchUpInside)
        ownView.goSingInButton.addTarget(self, action: #selector(callSingInViewController), for: .touchUpInside)
    }
    
    override func loadView() {
        view = FirstView()
        linkActionInFirstView()
    }
}
