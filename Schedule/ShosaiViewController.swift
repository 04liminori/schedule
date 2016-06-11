//
//  ShosaiViewController.swift
//  Schedule
//
//  Created by fukumoriminori on 2016/06/11.
//  Copyright © 2016年 fukumoriminori. All rights reserved.
//

import UIKit

class ShosaiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Storyboardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    var tasks:[Task] = [Task]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //テーブルビューのデータソースメソッドはViewControllerクラスに書くという設定
        table.dataSource = self
        
        self.setupTasks()
        
        //self.tableView.delegate = self
        //self.tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTasks() {
        
    }
    
    // セクション数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //セルの数を指定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        
        cell.yotei.text = "バイト"
        cell.time.text = "17:00"
        cell.name.text = "みのり"
        return cell
    }
    
    @IBAction func back(sender: UIButton) {
        print("back")
    }

    
}
