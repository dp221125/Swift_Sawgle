//
//  CustomTabBar.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 27/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class MainTabBarController: UIViewController {
    var homeViewController: HomeViewController?
    var boomarkViewController: BookMarkViewController?
    var myWriteViewController: MyWriteViewController?
    var settingViewController: SettingViewController?
    var mainNavigationController: UINavigationController?
    var viewControllerList = [UIViewController]()
    var previousIndex: Int?

    lazy var ownView: CustomTabBarView = {
        guard let convertView = view as? CustomTabBarView else {
            return CustomTabBarView()
        }

        return convertView
    }()

    @objc func linkAction(_ sender: UIButton) {
        if self.previousIndex != sender.tag {
            if self.previousIndex != nil {
                let previousButton = self.ownView.viewWithTag(self.previousIndex!) as? UIButton
                previousButton?.isSelected = false
            }
            sender.isSelected = true
            self.checkPreviousView()
            self.previousIndex = sender.tag
            self.moveView(sender.tag - 1)
        }
    }

    /// 새로운 뷰를 만들기 전에 기본의 뷰가 있으면 그 뷰를 제거한다.
    func checkPreviousView() {
        guard let prevSelectedIndex = previousIndex else {
            return
        }

        let prevViewArrayNumber = prevSelectedIndex - 1
        self.mainNavigationController?.willMove(toParent: nil)
        self.mainNavigationController?.view.removeFromSuperview()
        self.mainNavigationController?.removeFromParent()

        self.viewControllerList[prevViewArrayNumber].willMove(toParent: nil)
        self.viewControllerList[prevViewArrayNumber].view.removeFromSuperview()
        self.viewControllerList[prevViewArrayNumber].removeFromParent()
    }

    /// 새로운 뷰로 이동한다.
    func moveView(_ index: Int) {
        guard let targetView = view as? CustomTabBarView else {
            return
        }

        let newNavigationController = UINavigationController(rootViewController: viewControllerList[index])
        newNavigationController.navigationBar.barTintColor = UIColor(named: "Pale")
        newNavigationController.navigationBar.shadowImage = UIImage()
        newNavigationController.navigationBar.titleTextAttributes = [.font: UIFont().mainFont(displaySize: 24), .foregroundColor: UIColor.white]

        self.mainNavigationController = newNavigationController
        newNavigationController.view.frame = targetView.contentView.bounds
        addChild(newNavigationController)
        targetView.contentView.addSubview(newNavigationController.view)

        newNavigationController.didMove(toParent: self)
    }

    @objc func presentWriteView() {
        let writeView = WriteViewController()
        present(writeView, animated: true)
    }

    /// 각 탭바의 아이템들을 액션에 연결한다.
    func linkTargetAction() {
        guard let targetView = view as? CustomTabBarView else {
            return
        }

        if let firtButton = targetView.leftStack.firstItem as? ButtonStack {
            firtButton.button.addTarget(self, action: #selector(self.linkAction), for: .touchUpInside)
            firtButton.button.tag = 1
        }
        if let secondButton = targetView.leftStack.secondItem as? ButtonStack {
            secondButton.button.addTarget(self, action: #selector(self.linkAction), for: .touchUpInside)
            secondButton.button.tag = 2
        }
        if let thirdButton = targetView.rightStack.firstItem as? ButtonStack {
            thirdButton.button.addTarget(self, action: #selector(self.linkAction), for: .touchUpInside)
            thirdButton.button.tag = 3
        }
        if let fourButton = targetView.rightStack.secondItem as? ButtonStack {
            fourButton.button.addTarget(self, action: #selector(self.linkAction), for: .touchUpInside)
            fourButton.button.tag = 4
        }

        targetView.centerButton.addTarget(self, action: #selector(self.presentWriteView), for: .touchUpInside)
    }

    func makeViewControllerList() {
        guard let viewControllers = [homeViewController, boomarkViewController, myWriteViewController, settingViewController] as? [UIViewController] else {
            return
        }

        self.viewControllerList = viewControllers
    }

    override func loadView() {
        view = CustomTabBarView()
    }

    override func viewDidLoad() {
        self.homeViewController = HomeViewController()
        self.boomarkViewController = BookMarkViewController()
        self.myWriteViewController = MyWriteViewController()
        self.settingViewController = SettingViewController()

        self.makeViewControllerList()
        self.linkTargetAction()
    }

    /// 뷰가 로딩이 다 되고 난 뒤 기본 뷰를 셋팅한다.
    override func viewDidAppear(_: Bool) {
        if self.previousIndex == nil {
            if let startButton = ownView.viewWithTag(1) as? UIButton {
                self.linkAction(startButton)
            }
        }
    }
}

extension UIView {
    func makeLogoView() -> UIImageView {
        let logo = UIImage(named: "logo")
        let logoImageView = UIImageView(image: logo)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor).isActive = true
        return logoImageView
    }
}
