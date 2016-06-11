//
//  CalenderCell.swift
//  Schedule
//
//  Created by fukumoriminori on 2016/06/09.
//  Copyright © 2016年 fukumoriminori. All rights reserved.
//

import UIKit

class CalenderCell: UICollectionViewCell {
    
    var textLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // UILabelを生成
        textLabel = UILabel(frame: CGRectMake(0, 0, self.frame.width, self.frame.height))
        textLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        textLabel.textAlignment = NSTextAlignment.Center
        // Cellに追加
        self.addSubview(textLabel!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
}
