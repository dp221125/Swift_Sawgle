//
//  MyWriteHistoryViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 27/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class MyWriteViewController: UIViewController {
    
    lazy var ownView: MyWriteView = {
        
        guard let ownView = view as? MyWriteView else {
            return MyWriteView()
        }
        
        return ownView
    }()
    
    override func loadView() {
        view = MyWriteView()
    }
    
    override func viewDidLoad() {
        navigationItem.title = "mygle"
        
        ownView.mySubscribePostView.register(mySubscribePostCell.self, forCellWithReuseIdentifier: "mySubscribePostCell")
        ownView.mySubscribePostView.delegate = self
        ownView.mySubscribePostView.dataSource = self
    }
    
    
    override func viewDidLayoutSubviews() {
        
        let halfViewWidth = ownView.bounds.width / 2 - (ownView.nameImageView.bounds.width)
        
        if ownView.nameLabel.bounds.width > halfViewWidth {
            ownView.nameLabel.widthAnchor.constraint(equalToConstant: halfViewWidth).isActive = true
            ownView.nameLabel.adjustsFontSizeToFitWidth = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ownView.myWriteSectionView.countLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: ownView.myWriteSectionView.countLabel.bounds.height)
        ownView.myCommentSectionView.countLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: ownView.myCommentSectionView.countLabel.bounds.height)
        ownView.myLikePostSectionView.countLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: ownView.myLikePostSectionView.countLabel.bounds.height)
    }
}
extension MyWriteViewController: UICollectionViewDelegate { }
extension MyWriteViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mySubscribePostCell", for: indexPath) as? mySubscribePostCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}
extension MyWriteViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.bounds.width * 0.43
        let height = collectionView.bounds.height
        
        return CGSize(width: width, height: height)
    }
}
