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
        case tweet1 = "🐻🐻🐻くまに相談してから相談 🐻🐻🐻"
        case tweet2 = "今日覚えた言葉：ぬいぐるみデバッグ / 告白デバック"
        case tweet3 = "いままで bundle install したらプロジェクトディレクトリにいんすとーるされると思い込んでて path 指定してなかった。。ていうのが今日の気づき"
    }

}

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableData:[TimelineCellData] = []
    
    var selectedAccount: String!
    var selectedAvatar: String!
    var selectedName: String!
    var selectedTweet: String!
    var selectedDate: String!
    
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
        self.tableData = [data1, data2, data2, data3, data2, data3, data3, data1, data3, data3]
        
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
        return self.tableData.count
    }
    
    // MARK: セルの表示
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! MyTableViewCell
        let cellData = self.tableData[indexPath.row]
        
        let account = cellData.account
        cell.account?.text = account
   
        let avatar = cellData.avatar
        cell.avatar?.image = UIImage(named: avatar)

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
        tableView.estimatedRowHeight = cell.bounds.height
        tableView.rowHeight = UITableViewAutomaticDimension
        return tableView.rowHeight
    }

    // セルがタップされた時に画面遷移する
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cellData = self.tableData[indexPath.row]
        
        // 次の画面に渡すパラメーターをセットする
        self.selectedAccount = cellData.account
        self.selectedAvatar = cellData.avatar
        self.selectedName = cellData.name
        self.selectedTweet = cellData.tweet.rawValue
        self.selectedDate = cellData.date
        
        performSegueWithIdentifier("toDetailViewController", sender: self)
    }

    // DetailViewController から戻ってきた時の処理
    @IBAction func backFromDetailViewController(segue: UIStoryboardSegue) {
        NSLog("TimelineViewController#backFromDetailViewController")
    }

    
    // MEMO: prepareForSegueはSegue はビューが遷移するタイミングで呼ばれるもの
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        var detailVC: DetailViewController = segue.destinationViewController as! DetailViewController
        detailVC.selectedAccount = self.selectedAccount
        detailVC.selectedAvatar = self.selectedAvatar
        detailVC.selectedName = self.selectedName
        detailVC.selectedTweet = self.selectedTweet
        detailVC.selectedDate = self.selectedDate
    }
}

