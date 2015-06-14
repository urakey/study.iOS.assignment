//
//  TimelineViewController.swift
//  study.iOS
//
//  Created by Aki Fukayama on 2015/06/12.
//  Copyright (c) 2015年 Chocolateboard. All rights reserved.
//

import UIKit

// Dummy data
struct User {
    var account: String
    var avatar: String
    var name: String
    
    init() {
        account = "@urakey"
        avatar = "avatar_2.png"
        name = "akey"
    }
}

struct TimelineCellData {
    var account: String
    var avatar: String
    var name: String
    var tweet: Tweet
    var date: String

    // enum -> 列挙型
    enum Tweet: String {
        case tweet1 = "ツイート1ツイート1ツイート1"
        case tweet2 = "ツイート2ツイート2ツイート2ツイート2ツイート2ツイート2"
        case tweet3 = "ツイート3ツイート3ツイート3ツイート3ツイート3ツイート3ツイート3ツイート3"
    }

}

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableData:[TimelineCellData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Grouped)
        self.view.addSubview(tableView)
        
        let now = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "Y/MM/dd"
        
        let user = User()
        let date = dateFormatter.stringFromDate(now)
        
        let data1 = TimelineCellData(account: user.account, avatar: user.avatar, name: user.name, tweet: .tweet1, date: date)
        let data2 = TimelineCellData(account: user.account, avatar: user.avatar, name: user.name, tweet: .tweet2, date: date)
        let data3 = TimelineCellData(account: user.account, avatar: user.avatar, name: user.name, tweet: .tweet3, date: date)
        tableData = [data1, data2, data2, data3, data2, data3, data3, data1, data3, data3]
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: "MyTableViewCell", bundle: nil)
        tableView.registerNib(xib, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    // MARK: セルの表示
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! MyTableViewCell
        let cellData = tableData[indexPath.row]
        
        let account = cellData.account
        cell.account?.text = account
   
        let avatar = cellData.avatar
        cell.avatar?.image = UIImage(named:avatar)

        let name = cellData.name
        cell.name?.text = name
        
        let tweet = cellData.tweet.rawValue
        cell.tweet?.text = tweet
        
        let date = cellData.date
        cell.date?.text = date

        return cell
    }


    // セクション数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    // セルの高さ
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! MyTableViewCell
        return cell.bounds.height
    }
}

