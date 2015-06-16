//
//  DetailViewController.swift
//  study.iOS
//
//  Created by Aki Fukayama on 2015/06/14.
//  Copyright (c) 2015年 Chocolateboard. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var account: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tweet: UILabel!
    @IBOutlet weak var date: UILabel!
    
    // パラメータ受取用のプロパティ
    var selectedAccount: String!
    var selectedAvatar: String!
    var selectedName: String!
    var selectedTweet: String!
    var selectedDate: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println(self.selectedName)
        self.account?.text = self.selectedAccount
        self.avatar?.image = UIImage(named: self.selectedAvatar)
        self.name?.text = self.selectedName
        self.tweet?.text = self.selectedTweet
        self.date?.text = self.selectedDate

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}