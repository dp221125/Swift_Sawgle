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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class ReplyTextHeaderView: UIView {
    
    // MARK: Properties
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
        titleLabel.font = UIFont.init(name: "S-CoreDream-2ExtraLight", size: 18)
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
            self.bottomBorderView.heightAnchor.constraint(equalToConstant: 2),
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
            self.heartCountLabel.topAnchor.constraint(equalTo: self.heartImageView.bottomAnchor, constant: 0.3),
            self.heartCountLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5)
            ])
    }
    
    func setHeartCountView(count: Int){
        heartCountLabel.text = "\(count)"
        addSubview(heartImageView)
        addSubview(heartCountLabel)
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

