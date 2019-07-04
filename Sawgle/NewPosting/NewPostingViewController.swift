//
//  NewPostingViewController.swift
//  Sawgle
//
//  Created by Eddie Ahn on 18/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class NewPostingViewController: UIViewController {
    @IBOutlet var postingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.postingView.backgroundColor = .white
        self.postingView.layer.cornerRadius = 30
    }
}