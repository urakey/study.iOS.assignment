//
//  TimelineViewController.swift
//  study.iOS
//
//  Created by Aki Fukayama on 2015/06/12.
//  Copyright (c) 2015年 Chocolateboard. All rights reserved.
//

import Foundation
import UIKit

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Dummy data
    var itemes = [
        "ちょこれーと",
        "こーひー",
        "いちご",
        "おそば",
        "あいす",
        "こうちゃ",
        "けーき",
        "ぎょうざ",
        "ぱすた",
        "かにくりーむころっけ",
    ]
    
    // view 読み込み後
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MEMO: storyboard で設定するの？コードで設定するの？
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // MARK: セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemes.count
    }

    
    // MARK: セルの表示
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = itemes[indexPath.row]
        
        return cell
    }
}
