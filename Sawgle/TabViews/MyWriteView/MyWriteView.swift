//
//  MyWriteView.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 03/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class MyWriteView: UIView {
    
    let nameLabel: UILabel = {
        let nameLael = UILabel()
        nameLael.font = UIFont().mainFont(displaySize: 35)
        nameLael.textColor = UIColor.black
        nameLael.sizeToFit()
        nameLael.baselineAdjustment = .alignCenters
        return nameLael
    }()
    
    let nameImageView: UIImageView = {
        let nameImageView = UIImageView()
        nameImageView.image = UIImage(named: "logo")
        nameImageView.contentMode = UIView.ContentMode.scaleAspectFit
        return nameImageView
    }()
    
    let rightStackView: UIStackView = {
        let rightStackView = UIStackView()
        rightStackView.axis = NSLayoutConstraint.Axis.vertical
        rightStackView.distribution = UIStackView.Distribution.fillEqually
        return rightStackView
    }()
    
    let rightStackTitle: UILabel = {
        let rightStackTitle = UILabel()
        rightStackTitle.font = UIFont().mainFont(displaySize: 15)
        rightStackTitle.textColor = UIColor(named: "PaleBrown")
        rightStackTitle.text = "마지막 쓴 글"
        rightStackTitle.textAlignment = .right
        return rightStackTitle
    }()
    
    let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont().mainFont(displaySize: 15)
        dateLabel.textColor = UIColor.black
        dateLabel.textAlignment = .right
        return dateLabel
    }()
    
    let myWriteSectionView: MyWriteSectionView = {
        let myWriteSectionView = MyWriteSectionView()
        myWriteSectionView.sectionTitleLabel.text = "7일 내 내가 쓴 글"
        return myWriteSectionView
    }()
    
    let myCommentSectionView: MyWriteSectionView = {
        let myCommentSectionView = MyWriteSectionView()
        myCommentSectionView.sectionTitleLabel.text = "내가 쓴 댓글"
        return myCommentSectionView
    }()
    
    let myLikePostSectionView: MyWriteSectionView = {
        let myLikePostSectionView = MyWriteSectionView()
        myLikePostSectionView.sectionTitleLabel.text = "좋아요 한 글"
        return myLikePostSectionView
    }()
    
    let mySubscribePostView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10.0
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        let mySubscribePostView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        mySubscribePostView.backgroundColor = UIColor(named: "Pale")
        mySubscribePostView.showsHorizontalScrollIndicator = false
        return mySubscribePostView
    }()
    
    func makeNameLabelConstraint() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 16),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    func makeNameImageViewConstraint() {
        nameImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameImageView.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 0),
            nameImageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor,constant: 0),
            nameImageView.heightAnchor.constraint(equalTo: nameLabel.heightAnchor, multiplier: 0.6),
            nameImageView.widthAnchor.constraint(equalTo: nameImageView.heightAnchor)
            ])
    }
    
    func makeRightStackViewConstraint() {
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 10),
            rightStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -16),
            rightStackView.heightAnchor.constraint(equalTo: nameLabel.heightAnchor),
            ])
    }
    
    func makeMyWriteViewConstraint() {
        myWriteSectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myWriteSectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 16),
            myWriteSectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            myWriteSectionView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            myWriteSectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
            ])
    }
    
    func makeMyCommentViewConstraint() {
        myCommentSectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myCommentSectionView.topAnchor.constraint(equalTo: myWriteSectionView.bottomAnchor,constant: 10),
            myCommentSectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            myCommentSectionView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            myCommentSectionView.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.5,constant: -21)
            ])
    }
    
    func makeMyLikePostViewConstraint() {
        myLikePostSectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myLikePostSectionView.topAnchor.constraint(equalTo: myWriteSectionView.bottomAnchor,constant: 10),
            myLikePostSectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            myLikePostSectionView.leadingAnchor.constraint(equalTo: myCommentSectionView.trailingAnchor,constant: 10),
            myLikePostSectionView.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.5,constant: -21)
            ])
    }
    
    func makeMySubscribePostViewConstraint() {
        mySubscribePostView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mySubscribePostView.topAnchor.constraint(equalTo: myLikePostSectionView.bottomAnchor,constant: 10),
            mySubscribePostView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.24),
            mySubscribePostView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            mySubscribePostView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            ])
    }
    
    func addViewItem() {
        addSubview(nameLabel)
        addSubview(nameImageView)
        addSubview(rightStackView)
        addSubview(myWriteSectionView)
        addSubview(myCommentSectionView)
        addSubview(myLikePostSectionView)
        addSubview(mySubscribePostView)
    }
    
    func addViewItemConstraint() {
        makeNameLabelConstraint()
        makeNameImageViewConstraint()
        makeRightStackViewConstraint()
        makeMyWriteViewConstraint()
        makeMyCommentViewConstraint()
        makeMyLikePostViewConstraint()
        makeMySubscribePostViewConstraint()
    }
    
    func addStackItem() {
        rightStackView.addArrangedSubview(rightStackTitle)
        rightStackView.addArrangedSubview(dateLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.9215686275, blue: 0.8235294118, alpha: 1)
        addViewItem()
        addViewItemConstraint()
        addStackItem()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
