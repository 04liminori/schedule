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
    var time:String
    var yotei:String
    
    init(name: String, time: String, yotei: String){
        self.name = name
        self.time = time
        self.yotei = yotei
    }
}