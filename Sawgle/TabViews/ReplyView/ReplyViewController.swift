//
//  ReplyViewController.swift
//  Sawgle
//
//  Created by Min Kyeong Tae on 16/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {
    
    let replyTableView: UITableView = {
        let replyTableView = UITableView(frame: CGRect.zero, style: .grouped)
        replyTableView.tableHeaderView = UIView()
        replyTableView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        replyTableView.separatorStyle = .none
        return replyTableView
    }()
    
//    let settingTableView: UITableView = {
//        let settingTableView = UITableView(frame: CGRect.zero, style: .grouped)
//        settingTableView.tableFooterView = UIView()
//        settingTableView.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.9215686275, blue: 0.8235294118, alpha: 1)
//        settingTableView.separatorStyle = .none
//        return settingTableView
//    }()
    
    let starBarButtonItemStackView: UIStackView = {
        let starBarButtonItemStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        starBarButtonItemStackView.alignment = .center
        starBarButtonItemStackView.axis = .vertical
        starBarButtonItemStackView.spacing = 1
        return starBarButtonItemStackView
    }()
    
    let navigationItemTitleStackView: UIStackView = {
        let navigationItemTitleStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navigationItemTitleStackView.alignment = .center
        navigationItemTitleStackView.axis = .vertical
        navigationItemTitleStackView.spacing = 1
        return navigationItemTitleStackView
    }()
    
    // MARK:- viewController Delegate
    override func loadView(){
        self.view = UIView()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func viewDidLoad() {
        
        setBackBarButtonItem()
        setNavigationItemTitleStackView(titleName: "웃긴대학원")
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
    
    func setNavigationItemTitleStackView(titleName: String){
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        titleLabel.text = "\(titleName)"
        let titleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        titleImageView.image = #imageLiteral(resourceName: "logo")
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItemTitleStackView.addArrangedSubview(titleImageView)
        navigationItemTitleStackView.addArrangedSubview(titleLabel)
        
        navigationItem.titleView = navigationItemTitleStackView
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



