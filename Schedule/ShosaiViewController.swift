//
//  ShosaiViewController.swift
//  Schedule
//
//  Created by fukumoriminori on 2016/06/11.
//  Copyright © 2016年 fukumoriminori. All rights reserved.
//

import UIKit
import Firebase

class ShosaiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Storyboardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    var databaseRef:FIRDatabaseReference!
    
    var tasks:[Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.dataSource = self
        self.table.delegate = self
        
        
        databaseRef = FIRDatabase.database().reference()
        databaseRef.observeEventType(.ChildAdded, withBlock: { snapshot in
            if let name = snapshot.value!.objectForKey("name") as? String,
                date = snapshot.value!.objectForKey("date") as? String,
                time = snapshot.value!.objectForKey("time") as? String,
                yotei = snapshot.value!.objectForKey("yotei") as? String{
                    
                    let task = Task(name: name, date: date, time: time, yotei: yotei)
                    self.tasks.append(task)
                    
                    
                    self.tableView.reloadData()
            }
        })
        
        //選んだセルの日付とtaskの中のdateが同じTaskだけを表示
        //if seletedDate = Task.date {
            
        //}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // セクション数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //セルの数を指定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellA", forIndexPath: indexPath) as! CustomCell

        cell.name.text = tasks[indexPath.row].name
        cell.time.text = String(tasks[indexPath.row].time)
        cell.yotei.text = tasks[indexPath.row].yotei
        return cell
    
    }
    
}
