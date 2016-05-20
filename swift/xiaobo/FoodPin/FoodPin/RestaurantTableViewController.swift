//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by sawyerhuang on 16/5/12.
//  Copyright © 2016年 sawyerhuang. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurant = ["咖啡胡同", "霍米", "茶.家", "洛伊斯咖啡", "贝蒂生蚝", "福奇餐馆", "阿波画室", "伯克街面包坊", "黑氏巧克力", "惠灵顿雪梨", "北州", "布鲁克林塔菲", "格雷厄姆大街肉", "华夫饼 & 沃夫", "五叶", "眼光咖啡", "忏悔", "巴拉菲娜", "多尼西亚", "皇家橡树", "泰咖啡"]
    
    var restaurantImage =
        ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var restaurantLocation = ["香港", "香港", "香港", "香港", "香港", "香港", "香港", "悉尼", "悉尼", "悉尼", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "伦敦", "伦敦", "伦敦", "伦敦"]

    var restaurantType = ["咖啡 & 茶店","咖啡", "茶屋", "奥地利式 & 休闲饮料","法式", "面包房", "面包房", "巧克力", "咖啡", "美式 & 海鲜", "美式", "美式","早餐 & 早午餐", "法式 & 茶", "咖啡 & 茶", "拉丁美式", "西班牙式", "西班牙式", "西班牙式", "英式", "泰式"]
 
    
    //等价于赋值21个false
    var restaurantHadcome = [Bool](count: 21, repeatedValue: false)
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurant.count
    }
    
    /*
    //选择了行以后的操作
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let alert = UIAlertController(title: nil, message: "亲，您选择了我～", preferredStyle: .ActionSheet )
        
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        
        let dialHandle = { (action:UIAlertAction) -> Void in
            let alert = UIAlertController(title: "提示", message: "您拨打的电话暂时无法接通", preferredStyle: .Alert)
            let action = UIAlertAction(title: "ok", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        
        let phoneNum = indexPath.row + 1
        let dialAction = UIAlertAction(title: "拨打 021-6533\(phoneNum)", style: .Default, handler: dialHandle)
        
        let hadCome = UIAlertAction(title: "我来过", style: .Default) { (_) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            //右侧勾选
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark

            self.restaurantHadcome[indexPath.row] = true
            
        }
        
        alert.addAction(cancelAction)
        alert.addAction(dialAction)
        alert.addAction(hadCome)
        
        self.presentViewController(alert, animated: true, completion: nil)

    }
    */
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell

        cell.restaurantImage.image = UIImage(named: restaurantImage[indexPath.row])
        cell.restaurantName.text = restaurant[indexPath.row]
        
        //图片圆角化
        cell.restaurantImage.layer.cornerRadius = cell.restaurantImage.frame.size.width / 2
        //使layer设置生效
        cell.restaurantImage.clipsToBounds = true
        cell.restaurantLocation.text = restaurantLocation[indexPath.row]
        cell.restaurantType.text = restaurantType[indexPath.row]
        
        
        
         
        return cell
    
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    //自己编写    tableView( ， editActionsForRowAtIndexPath indexPath: NSIndexPath) 系统的就失效了

//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            // Delete the row from the data source
//            
//            restaurant.removeAtIndex(indexPath.row)
//            restaurantImage.removeAtIndex(indexPath.row)
//            restaurantLocation.removeAtIndex(indexPath.row)
//            restaurantType.removeAtIndex(indexPath.row)
//            restaurantHadcome.removeAtIndex(indexPath.row)
//            
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//
//            //tableView.reloadData()
//            
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        
//        }
//    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let share = UITableViewRowAction(style: .Default, title: "分享") { (action, indexPath) -> Void in
            
            let alert = UIAlertController(title: "分享到", message: "请选择您要分享到", preferredStyle: .ActionSheet)
            
            let qqAction = UIAlertAction(title: "qq", style: .Default, handler: nil)
            let weiboAction = UIAlertAction(title: "微博", style: .Default, handler: nil)
            let weixinAction = UIAlertAction(title: "微信", style: .Default, handler: nil)
            let cancel = UIAlertAction(title: "取消", style: .Cancel, handler: nil)

            alert.addAction(qqAction)
            alert.addAction(weiboAction)
            alert.addAction(weixinAction)
            alert.addAction(cancel)
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        let delete = UITableViewRowAction(style: .Default, title: "删除") { (action, indexPath) -> Void in
            
            self.restaurant.removeAtIndex(indexPath.row)
            self.restaurantImage.removeAtIndex(indexPath.row)
            self.restaurantLocation.removeAtIndex(indexPath.row)
            self.restaurantType.removeAtIndex(indexPath.row)
            self.restaurantHadcome.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

        }
        
        share.backgroundColor = UIColor(red: 218/255, green: 255/255, blue: 230/255, alpha: 1)

        return [delete, share]
    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showRestaurantDetail" {
            
            let destVC = segue.destinationViewController as! RestaurantDetailViewController
            
            destVC.restaurantName = restaurantImage[tableView.indexPathForSelectedRow!.row]
            
        }
    }
}
