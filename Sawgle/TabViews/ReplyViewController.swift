//
//  ReplyViewController.swift
//  Sawgle
//
//  Created by Min Kyeong Tae on 16/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {

    
    
    // MARK:- viewController Delegate
    override func loadView(){
        self.view = UIView()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func viewDidLoad() {
        navigationItem.title = "웃긴대학원"
        
        setBackBarButtonItem()
        setStarBarButtonItem(count: 10)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ReplyView")
    }
    
    // MARK:- setConstraints
    
    // MARK:- setting Methods
    func setBackBarButtonItem(){
        let backButton = UIButton(type: .custom)
        let originImage = #imageLiteral(resourceName: "Back")
        let renderingImage = originImage.withRenderingMode(.alwaysTemplate)
        backButton.setImage(renderingImage, for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        backButton.tintColor = UIColor(named: "PinkishGrey")
        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: UIControl.Event.touchUpInside)
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    func setStarBarButtonItem(count: Int){
        
        let starCountLabel = UILabel()
        let starButton = UIButton(type: .custom)
        let originImage = #imageLiteral(resourceName: "star")
        starButton.setImage(originImage, for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        starButton.sizeToFit()
        starButton.addTarget(self, action: #selector(starBarButtonItemPressed(_:)), for: UIControl.Event.touchUpInside)
        starCountLabel.text = "\(count)"
        starCountLabel.sizeToFit()
        let starBarButtonItemView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        starBarButtonItemView.addSubview(starButton)
//        starBarButtonItemView.addSubview(starCountLabel)
        
        // MARK:- Set starBarButtonItem Constraints
        NSLayoutConstraint.activate([
            starButton.centerXAnchor.constraint(equalTo: starBarButtonItemView.centerXAnchor),
//            starButton.topAnchor.constraint(equalTo: starBarButtonItemView.topAnchor),
            starButton.heightAnchor.constraint(equalTo: starBarButtonItemView.heightAnchor, multiplier: 0.2)
//            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            contentView.widthAnchor.constraint(equalTo: widthAnchor),
//            contentView.bottomAnchor.constraint(equalTo: customTabBar.topAnchor, constant: -5),
//            contentView.topAnchor.constraint(equalTo: topAnchor),
            ])
        
        
//        NSLayoutConstraint.activate([
//            starCountLabel.centerXAnchor.constraint(equalTo: starBarButtonItemView.centerXAnchor),
//            starCountLabel.topAnchor.constraint(equalTo: starButton.topAnchor),
//            starCountLabel.bottomAnchor.constraint(equalTo: starBarButtonItemView.bottomAnchor)
//
//            ])
//
        let starBarButtonItem = UIBarButtonItem(customView: starBarButtonItemView)
        self.navigationItem.rightBarButtonItem = starBarButtonItem
    }
    
    // MARK:- TouchEvents Methods
    @objc func backButtonPressed(_ sender: UIButton){
        print("backButtonItemPressed")
        self.dismissDetail()
    }
    
    @objc func starBarButtonItemPressed(_ sender: UIButton){
        print("rightBarButtonItemPressed")
    }
}



