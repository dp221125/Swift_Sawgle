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
    // 싱글턴 구현을 고려해봐야 한다? // Dispatch once?
    // 리펙토링은 디자인패턴구성
    // 네이밍 등.... 정리
    // set,get사용 미사용은 하기나름 물론 약속이 되었으면 그대로 가면 된다.
    lazy var ownView: StartingView = {
        let convertView = StartingView()
        return convertView
    }()

//    lazy var ownView: StartingView = {
//        guard let convertView = view as? StartingView else { // Dispatch once
//            return StartingView() // 한번만 호출된다 생각했으면, 굳이 guard let 처리로 의미가없다
//        }
//        return convertView
//    }()

    /// 로그인 화면을 생성한다.
    @objc func presentSignInViewController() {
        let signInViewController = SignInViewController()

        self.present(signInViewController, animated: true)
    }

    /// 회원가입화면을 생성한다.
    @objc func presentSignUpViewController() {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let signInViewController = mainStoryBoard.instantiateViewController(withIdentifier: "newSignUpViewController")

        self.present(signInViewController, animated: true)
    }

    /// 각각 버튼에 액션을 연결한다.
    func linkActionInStartingView() {
        self.ownView.signInButton.addTarget(self, action: #selector(self.presentSignInViewController), for: .touchUpInside)
        self.ownView.signUpButton.addTarget(self, action: #selector(self.presentSignUpViewController), for: .touchUpInside)
    }

    override func loadView() {
        view = self.ownView
    }

    override func viewDidLoad() {
        self.linkActionInStartingView()
    }
}
