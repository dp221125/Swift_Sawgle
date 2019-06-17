//
//  ReplyView.swift
//  Sawgle
//
//  Created by Min Kyeong Tae on 17/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class ReplyView: UIView {
    
    // MARK: Setting Views
    let replyTableView: UITableView = {
        let replyTableView = UITableView(frame: CGRect.zero, style: .grouped)
        replyTableView.backgroundColor = UIColor(named: "PinkishGrey")
        replyTableView.separatorStyle = .none
        return replyTableView
    }()
    
    // MARK:- Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.addSubview(replyTableView)
        self.setReplyTableViewConstratins()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK:- Setting Methods
    // MARK: setViewConstraints
    func setReplyTableViewConstratins(){
        replyTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            replyTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            replyTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            replyTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            replyTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor)
            ])
    }
}
