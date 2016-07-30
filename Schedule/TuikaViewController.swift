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

class TuikaViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet weak var lbDate: UIDatePicker!
    var date: String?
    var saveDate : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var databaseRef:FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        databaseRef = FIRDatabase.database().reference()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        textField.text = saveDate.objectForKey("yotei") as! String?
    }
    
    // デートピッカー値変更時
    @IBAction func changeDate(sender: UIDatePicker) {
        
        date = String(sender.date)
    }
    
    @IBAction func save() {
        //let task = Task(name: "みのり", time: self.date!, yotei: self.textField.text!)
        let task = Task(name: "みのり", time: "15:00", yotei: "ああああああ")
        let taskPost = ["name": task.name, "time": task.time, "yotei": task.yotei]
        databaseRef.childByAutoId().setValue(taskPost)
        
        textField.resignFirstResponder()
        
        
        //アラート出すよ
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

