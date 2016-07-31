//
//  Tuika.swift
//  Schedule
//
//  Created by fukumoriminori on 2016/06/25.
//  Copyright © 2016年 fukumoriminori. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class TuikaViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet weak var lbDate: UIDatePicker!
    var date: String?
    var saveDate : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var databaseRef:FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        databaseRef = FIRDatabase.database().reference()
        textField.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        textField.text = saveDate.objectForKey("yotei") as! String?
    }
    
    
    @IBAction func save() {
        //let task = Task(name: "みのり", time: self.date!, yotei: self.textField.text!)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH時mm分"
        let formattedDate = dateFormatter.stringFromDate(lbDate.date)
        
        let dateFormatter2 = NSDateFormatter()
        dateFormatter2.dateFormat = "yyyy年MM月dd日"
        let formattedDate2 = dateFormatter2.stringFromDate(lbDate.date)

        
        
        let task = Task(name: "みのり", date: formattedDate2 , time: formattedDate, yotei: textField.text!)
        let taskPost = ["name": task.name, "date": task.date, "time": task.time, "yotei": task.yotei]
        databaseRef.childByAutoId().setValue(taskPost)
        //print(task.name)
        
        textField.resignFirstResponder()
        
        
        //完了アラート
        let alert:UIAlertController = UIAlertController(title: "保存完了！", message: "予定を追加しました。", preferredStyle: .Alert)
        
        //okボタン
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler: {action in //ボタンが押された時
                    self.navigationController?.popViewControllerAnimated(true)
                    print("OKボタンが押されました")
                }
            )
        )
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
}

