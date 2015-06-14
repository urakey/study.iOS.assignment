//
//  TimelineViewController.swift
//  study.iOS
//
//  Created by Aki Fukayama on 2015/06/12.
//  Copyright (c) 2015年 Chocolateboard. All rights reserved.
//

import UIKit

// Dummy data
struct TimelineCellData {
    var name:User
    var avatar:User
    var tweet:Tweet
    
    enum User:String {
        case name = "urakey"
        case avatar = "icon.png"
    }
    
    enum Tweet:String {
        case tweet1 = "ツイート1ツイート1ツイート1"
        case tweet2 = "ツイート2ツイート2ツイート2ツイート2ツイート2ツイート2"
        case tweet3 = "ツイート3ツイート3ツイート3ツイート3"
    }
}

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableData:[TimelineCellData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Grouped)
        self.view.addSubview(tableView)
        
        let data1 = TimelineCellData(name:.name, avatar:.avatar, tweet:.tweet1)
        let data2 = TimelineCellData(name:.name, avatar:.avatar, tweet:.tweet2)
        let data3 = TimelineCellData(name:.name, avatar:.avatar, tweet:.tweet3)
        tableData = [data1, data2, data2, data3, data2, data3, data3, data1]
        
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
        
        let avatar = cellData.avatar.rawValue
        cell.avatar?.image = UIImage(named:avatar)
        
        let tweet = cellData.tweet.rawValue
        cell.tweet?.text = tweet

        let name = cellData.name.rawValue
        cell.name?.text = name
        
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

