//
//  FirstViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 24/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {
    
    // ownView는 전부 아래와 같이 셋팅한다.
    lazy var ownView: StartingView = {
        let convertView = StartingView() 
        return convertView
    }()

    /// 로그인 화면을 생성한다.
    @objc func presentSignInVC() {
        let signInVC = SignInViewController()

        self.present(signInVC, animated: true)
    }

    /// 회원가입화면을 생성한다.
    @objc func presentSignUpVC() {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = mainStoryBoard.instantiateViewController(withIdentifier: "newSignUpVC")

        self.present(signInVC, animated: true)
    }
    
    /// 각각 버튼에 액션을 연결한다.
    func linkActionInStartingView() {
        ownView.signInButton.addTarget(self, action: #selector(self.presentSignInVC), for: .touchUpInside)
        ownView.signUpButton.addTarget(self, action: #selector(self.presentSignUpVC), for: .touchUpInside)
    }

    override func loadView() {
        view = ownView
    }

    override func viewDidLoad() {
        self.linkActionInStartingView()
    }
}
