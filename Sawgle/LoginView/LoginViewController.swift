//
//  LoginViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 24/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @objc func callParentViewController() {
        self.dismiss(animated: true)
    }
    
    func linkActionInLoginVC() {
        
        guard let ownView = view as? LoginView else {
            return
        }
        
        ownView.backButton.addTarget(self, action: #selector(callParentViewController), for: .touchUpInside)
    }
    
    override func loadView() {
        view = LoginView()
        linkActionInLoginVC()
    }
}
