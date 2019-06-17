//
//  ReplyViewController.swift
//  Sawgle
//
//  Created by Min Kyeong Tae on 16/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {
    
    let replyTextTableViewCellIdentifier = "replyTextTableViewCell"
    let replyPostTableViewCellIdentifier = "replyPostTableViewCell"
    //    let replyTextHeaderTableViewCellIdentifier = "ReplyTextHeaderTableViewCell"
    
    lazy var replyView: ReplyView = {
        guard let replyView = view as? ReplyView else { return ReplyView() }
        return replyView
    }()
    
    // MARK: navigationItemTitle UI
    let navigationItemTitleStackView: UIStackView = {
        let navigationItemTitleStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navigationItemTitleStackView.alignment = .center
        navigationItemTitleStackView.axis = .vertical
        navigationItemTitleStackView.spacing = 1
        return navigationItemTitleStackView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        titleLabel.font = UIFont.init(name: "S-CoreDream-2ExtraLight", size: 12.3)
        titleLabel.tintColor = UIColor(named: "greyishBrown")
        return titleLabel
    }()
    
    let titleImageView: UIImageView = {
        let titleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        titleImageView.image = #imageLiteral(resourceName: "logo")
        titleImageView.contentMode = .scaleAspectFit
        return titleImageView
    }()
    
    // MARK: starBarButtonItem UI
    let starBarButtonItemStackView: UIStackView = {
        let starBarButtonItemStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        starBarButtonItemStackView.alignment = .center
        starBarButtonItemStackView.axis = .vertical
        starBarButtonItemStackView.spacing = 1
        return starBarButtonItemStackView
    }()
    
    let starCountLabel: UILabel = {
        let starCountLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        starCountLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 10)
        starCountLabel.tintColor = UIColor(named: "greyishBrown")
        return starCountLabel
    }()
    
    let starButtonImageView: UIImageView = {
        let starButtonImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        starButtonImageView.image = #imageLiteral(resourceName: "star")
        starButtonImageView.contentMode = .scaleAspectFit
        return starButtonImageView
    }()
    
    // MARK:- viewController Delegate
    override func loadView(){
        self.view = ReplyView()
    }
    
    override func viewDidLoad() {
        
        self.replyView.replyTableView.dataSource = self
        self.replyView.replyTableView.delegate = self
        registerTableViewCell()
        setBackBarButtonItem()
        setNavigationItemTitleStackView(titleName: "웃긴대학원")
        setStarBarButtonItem(count: 10)
        setConstraints()
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
        titleLabel.text = "\(titleName)"
        navigationItemTitleStackView.addArrangedSubview(titleImageView)
        navigationItemTitleStackView.addArrangedSubview(titleLabel)
        navigationItem.titleView = navigationItemTitleStackView
    }
    
    func setStarBarButtonItem(count: Int) {
        self.starCountLabel.text = "\(count)"
        self.starBarButtonItemStackView.addArrangedSubview(starButtonImageView)
        self.starBarButtonItemStackView.addArrangedSubview(starCountLabel)
        
        let starBarButtonItem = UIBarButtonItem(customView: starBarButtonItemStackView)
        self.navigationItem.rightBarButtonItem = starBarButtonItem
    }
    
    func registerTableViewCell() {
        self.replyView.replyTableView.register(ReplyTextTableViewCell.self, forCellReuseIdentifier: self.replyTextTableViewCellIdentifier)
        self.replyView.replyTableView.register(ReplyPostTableViewCell.self, forCellReuseIdentifier: self.replyPostTableViewCellIdentifier)
    }
    
    func setConstraints() {
        self.starButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        self.starCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starButtonImageView.heightAnchor.constraint(equalTo: self.starCountLabel.heightAnchor, multiplier: 0.63)
            ])
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleImageView.heightAnchor.constraint(equalTo: self.titleLabel.heightAnchor, multiplier: 0.63)
            
            ])
    }
    
    // MARK:- TouchEvents Methods
    @objc func backButtonPressed(_ sender: UIButton) {
        print("backButtonItemPressed")
        self.dismissDetail()
    }
    
    @objc func starBarButtonItemPressed(_ sender: UIButton) {
        print("rightBarButtonItemPressed")
    }
}

extension ReplyViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        else { return 10 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            guard let replyTextTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.replyTextTableViewCellIdentifier, for: indexPath) as? ReplyTextTableViewCell else { return UITableViewCell() }
            replyTextTableViewCell.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            return replyTextTableViewCell
        }
        else {
            guard let replyPostTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.replyPostTableViewCellIdentifier, for: indexPath) as? ReplyPostTableViewCell else { return UITableViewCell() }
            replyPostTableViewCell.backgroundColor = UIColor(named: "Pale")
            return replyPostTableViewCell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let textHeaderView = ReplyTextHeaderView()
            textHeaderView.backgroundColor = UIColor(named: "Pale")
            return textHeaderView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 80 : UITableView.automaticDimension
    }
}

extension ReplyViewController: UITableViewDelegate {
    
}
