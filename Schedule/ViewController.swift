//
//  ViewController.swift
//  Schedule
//
//  Created by fukumoriminori on 2016/04/24.
//  Copyright © 2016年 fukumoriminori. All rights reserved.
//

import UIKit

extension UIColor {
    class func lightBlue() -> UIColor {
        return UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    }
    
    class func lightRed() -> UIColor {
        return UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    }
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let dateManager = DateManager()
    let daysPerWeek: Int = 7
    let cellMargin: CGFloat = 2.0
    var selectedDate = NSDate()
    var today: NSDate!
    let weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    @IBOutlet weak var headerPrevBtn: UIButton!//①
    @IBOutlet weak var headerNextBtn: UIButton!//②
    @IBOutlet weak var headerTitle: UILabel!    //③
    @IBOutlet weak var calenderHeaderView: UIView! //④
    @IBOutlet weak var calenderCollectionView: UICollectionView!//⑤

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        calenderCollectionView.delegate = self
        headerTitle.text = changeHeaderTitle(selectedDate) //追記
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //1
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    //2
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Section毎にCellの総数を変える.
        if section == 0 {
            return 7
        } else {
            return dateManager.daysAcquisition() //ここは月によって異なる(後ほど説明します)
        }
    }
    
    //3
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CalenderCell
        //テキストカラー
        if (indexPath.row % 7 == 0) {
            cell.textLabel.textColor = UIColor.lightRed()
        } else if (indexPath.row % 7 == 6) {
            cell.textLabel.textColor = UIColor.lightBlue()
        } else {
            cell.textLabel.textColor = UIColor.grayColor()
        }
        //テキスト配置
        if indexPath.section == 0 {
            cell.textLabel.text = weekArray[indexPath.row]
        } else {
            cell.textLabel.text = dateManager.conversionDateFormat(indexPath)
            //月によって1日の場所は異なる
        }
        return cell
    }
    
    //セルのサイズを設定
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let numberOfMargin: CGFloat = 8.0
        let width: CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin) / CGFloat(daysPerWeek)
        let height: CGFloat = width * 1.0
        return CGSizeMake(width, height)
        
    }
    
    //セル選択時
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        _ = UIApplication.sharedApplication().delegate as! AppDelegate
        //appDelegate. = [indexPath.row]
        print(selectedDate)
        print(dateManager.conversionDateFormat(indexPath))
       
        let pageViewController = self.storyboard!.instantiateViewControllerWithIdentifier("ShosaiViewController") as! ShosaiViewController
        self.navigationController?.pushViewController(pageViewController, animated: true)
    }
    
    //セルの垂直方向のマージンを設定
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellMargin
    }
    
    //セルの水平方向のマージンを設定
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellMargin
    }
    
    //headerの月を変更
    func changeHeaderTitle(date: NSDate) -> String {
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "M/yyyy"
        let selectMonth = formatter.stringFromDate(date)
        return selectMonth
    }
    
    //①タップ時
    @IBAction func tappedHeaderPrevBtn(sender: UIButton) {
        selectedDate = dateManager.prevMonth(selectedDate)
        calenderCollectionView.reloadData()
        headerTitle.text = changeHeaderTitle(selectedDate)
    }
    
    //②タップ時
    @IBAction func tappedHeaderNextBtn(sender: UIButton) {
        selectedDate = dateManager.nextMonth(selectedDate)
        calenderCollectionView.reloadData()
        headerTitle.text = changeHeaderTitle(selectedDate)
    }
    

}

