//
//  ReplyTableViewCell.swift
//  Sawgle
//
//  Created by Min Kyeong Tae on 17/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

/// MARK: 글 제목 및 텍스트 뷰 셀
class ReplyTextTableViewCell: UITableViewCell {
    
    let replyTextView: UITextView = {
        let replyTextView = UITextView()
        replyTextView.textContainerInset = UIEdgeInsets(top: 0, left: -replyTextView.textContainer.lineFragmentPadding, bottom: 0, right: replyTextView.textContainer.lineFragmentPadding)
        replyTextView.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0)
        replyTextView.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 12)
        replyTextView.textColor = UIColor(named: "greyishBrown")
        replyTextView.isEditable = false
        replyTextView.isScrollEnabled = false
        //        replyTextView.clipsToBounds = true
        //        replyTextView.autoresizesSubviews = false
        
        return replyTextView
    }()
    
    func setReplyTextView(text: String) {
        replyTextView.text = text
    }
    
    func setConstraint() {
        replyTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            replyTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            replyTextView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            replyTextView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15.7),
            replyTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -80)
            ])
    }
    
    func addSubViews(){
        addSubview(replyTextView)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        setReplyTextView(text: "안녕하세요 \n안녕하세요입니다. \n가나다라마바사아자차카타파하 \n 으에으에으어허 \n 안녕하세요 \n안녕하세요입니다. \n가나다라마바사아자차카타파하 \n 으에으에으어허안녕하세요 \n안녕하세요입니다. \n가나다라마바사아자차카타파하 \n 으에으에으어허 \n 안녕하세요 \n안녕하세요입니다. \n가나다라마바사아자차카타파하 \n 으에으에으어허")
        setConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class ReplyTextHeaderView: UIView {
    
    // MARK:- Properties
    lazy var textDateFormatter: DateFormatter = {
        let textDateFormatter = DateFormatter()
        textDateFormatter.dateFormat = "yyyy.MM.dd a h:mm"
        textDateFormatter.locale = Locale(identifier: "ko_KR")
        return textDateFormatter
    }()
    
    let bottomBorderView: UIView = {
        let bottomBorderView = UIView()
        bottomBorderView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return bottomBorderView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 18)
        titleLabel.text = "올코드 가즈아-- OTL"
        return titleLabel
    }()
    
    let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont.init(name: "S-CoreDream-2ExtraLight",size: 10)
        
        return dateLabel
    }()
    
    let heartImageView: UIImageView = {
        let heartImageView = UIImageView(image: #imageLiteral(resourceName: "heart"))
        heartImageView.contentMode = .scaleAspectFit
        return heartImageView
    }()
    
    let heartCountLabel: UILabel = {
        let heartCountLabel = UILabel()
        heartCountLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 10)
        return heartCountLabel
    }()
    
    // MARK:- Setting Methods
    func setSubViews() {
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(bottomBorderView)
        setHeartCountView(count: 10)
    }
    
    func setConstraints() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            self.titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            self.titleLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.76)
            ])
        
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.dateLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            self.dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            self.dateLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor, multiplier: 0.8)
            ])
        
        self.bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.bottomBorderView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            self.bottomBorderView.heightAnchor.constraint(equalToConstant: 1.0),
            self.bottomBorderView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            self.bottomBorderView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
            ])
        
        self.heartImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heartImageView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10),
            self.heartImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25),
            self.heartImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -10)
            ])
        
        self.heartCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heartCountLabel.centerXAnchor.constraint(equalTo: self.heartImageView.centerXAnchor),
            self.heartCountLabel.topAnchor.constraint(equalTo: self.heartImageView.bottomAnchor, constant: -15),
            self.heartCountLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5)
            ])
    }
    
    func setHeartCountView(count: Int){
        heartCountLabel.text = "\(count)"
        addSubview(heartImageView)
        addSubview(heartCountLabel)
    }
    
    // MARK:- Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubViews()
        setConstraints()
        let date = Date()
        dateLabel.text = textDateFormatter.string(from: date)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

/// MARK: 댓글 입력 및 댓글내용 셀
class ReplyPostTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


/// MARK:- 댓글섹션 헤더 뷰
class ReplyPostHeaderView: UIView {
    
    // MARK: headerView UI
    let postHeaderTitleLabel: UILabel = {
        let postHeaderTitleLabel = UILabel()
        postHeaderTitleLabel.text = "댓글"
        postHeaderTitleLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 18)
        return postHeaderTitleLabel
    }()
    
    let postHeaderTextField: UITextField = {
        let postHeaderTextField = UITextField()
        postHeaderTextField.placeholder = " Saw that Gle"
        postHeaderTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return postHeaderTextField
    }()
    
    let postHeaderButton: UIButton = {
        let postHeaderButton = UIButton()
        postHeaderButton.setTitle("써댓글", for: .normal)
        postHeaderButton.titleLabel?.allowsDefaultTighteningForTruncation = false
        postHeaderButton.titleLabel?.adjustsFontSizeToFitWidth = true
        postHeaderButton.titleLabel?.font = UIFont(name:"S-CoreDream-2ExtraLight", size: 10)
        postHeaderButton.titleLabel?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        postHeaderButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return postHeaderButton
    }()
    
    let postHeaderBottomBorderView: UIView = {
        let bottomBorderView = UIView()
        bottomBorderView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return bottomBorderView
    }()
    
    func addSubview() {
        addSubview(postHeaderTitleLabel)
        addSubview(postHeaderTextField)
        addSubview(postHeaderButton)
        addSubview(postHeaderBottomBorderView)
    }
    
    func setConstraint() {
        self.postHeaderTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postHeaderTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            postHeaderTitleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            postHeaderTitleLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15.7)
            ])
        
        self.postHeaderTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postHeaderTextField.leftAnchor.constraint(equalTo: postHeaderTitleLabel.leftAnchor),
            postHeaderTextField.topAnchor.constraint(equalTo: postHeaderTitleLabel.bottomAnchor, constant: 10),
            postHeaderTextField.widthAnchor.constraint(equalTo: postHeaderTitleLabel.widthAnchor, multiplier: 0.85),
            postHeaderTextField.heightAnchor.constraint(equalTo: postHeaderTitleLabel.heightAnchor, multiplier: 1.3)
            ])
        
        self.postHeaderButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postHeaderButton.leftAnchor.constraint(equalTo: postHeaderTextField.rightAnchor),
            postHeaderButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15.7),
            postHeaderButton.centerYAnchor.constraint(equalTo: postHeaderTextField.centerYAnchor),
            postHeaderButton.heightAnchor.constraint(equalTo: postHeaderTextField.heightAnchor)
            ])
        
        self.postHeaderBottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postHeaderBottomBorderView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            postHeaderBottomBorderView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            postHeaderBottomBorderView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            postHeaderBottomBorderView.heightAnchor.constraint(equalToConstant: 1.0)
            ])
    }
    
    func setPostReplyCount(count: Int){
        let titleLabelText: String?
        if count == 0 { titleLabelText = "댓글 없음" }
        else { titleLabelText = "댓글 \(count)" }
        postHeaderTitleLabel.text = titleLabelText
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setConstraint()
        setPostReplyCount(count: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

