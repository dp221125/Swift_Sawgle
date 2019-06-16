//
//  ReplyViewController.swift
//  Sawgle
//
//  Created by Min Kyeong Tae on 16/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {
    
    let starBarButtonItemStackView = { () -> UIStackView in
        let starBarButtonItemStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        starBarButtonItemStackView.alignment = .center
        starBarButtonItemStackView.axis = .vertical
        starBarButtonItemStackView.spacing = 1
        return starBarButtonItemStackView
    }()
    
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
        
        let starCountLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let starButtonImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        starCountLabel.font = UIFont(name: "SCDream2", size: 8)
        starCountLabel.text = "\(count)"
        starButtonImageView.image = #imageLiteral(resourceName: "star")
        starButtonImageView.contentMode = .scaleAspectFit
        
        starBarButtonItemStackView.addArrangedSubview(starButtonImageView)
        starBarButtonItemStackView.addArrangedSubview(starCountLabel)
        
        let starBarButtonItem = UIBarButtonItem(customView: starBarButtonItemStackView)
        
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



