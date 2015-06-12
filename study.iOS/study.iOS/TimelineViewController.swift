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
    
    var itemes = ["ちょこれーと", "こーひー", "いちご", "おそば"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("datas") as! UITableViewCell

        cell.textLabel!.text = "てすと"
        
        return cell
    }
}
