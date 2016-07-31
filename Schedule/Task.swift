//
//  Model.swift
//  Schedule
//
//  Created by fukumoriminori on 2016/06/11.
//  Copyright © 2016年 fukumoriminori. All rights reserved.
//

import Foundation

class Task {
    var name:String
    var date:String
    var time:String
    var yotei:String
    
    init(name: String, date: String, time: String, yotei: String){
        self.name = name
        self.date = date
        self.time = time
        self.yotei = yotei
    }
}