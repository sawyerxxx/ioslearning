//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by sawyerhuang on 16/5/12.
//  Copyright © 2016年 sawyerhuang. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurants = [
        Restaurant(name: "咖啡胡同", type: "咖啡 & 茶店", location: "香港上环德辅道西78号G/F", image: "cafedeadend.jpg", isVisited: false) ,
        Restaurant(name: "霍米", type: "咖啡", location: "香港上环文咸东街太平山22-24A，B店", image: "homei.jpg", isVisited: false) ,
        Restaurant(name: "茶.家", type: "茶屋", location: "香港葵涌和宜合道熟食市场地下", image: "teakha.jpg", isVisited: false) ,
        Restaurant(name: "洛伊斯咖啡", type: "奥地利式 & 休闲饮料", location: "香港新界葵涌屏富径", image: "cafeloisl.jpg", isVisited: false) ,
        Restaurant(name: "贝蒂生蚝", type: "法式", location: "香港九龙尖沙咀河内道18号(近港铁尖东站N3,N4出口) ", image: "petiteoyster.jpg", isVisited: false) ,
        Restaurant(name: "福奇餐馆", type: "面包房", location: "香港岛中环都爹利街13号乐成行地库中层", image: "forkeerestaurant.jpg", isVisited: false) ,
        Restaurant(name: "阿波画室", type: "面包房", location: "香港岛铜锣湾轩尼诗道555号崇光百货地库2楼30号铺", image: "posatelier.jpg", isVisited: false) ,
        Restaurant(name: "伯克街面包坊", type: "巧克力", location: "4 Hickson Rd、The Rocks NSW 2000", image: "bourkestreetbakery.jpg", isVisited: false) ,
        Restaurant(name: "黑氏巧克力", type: "咖啡", location: "31 Wheat Rd、Sydney NSW 2001", image: "haighschocolate.jpg", isVisited: false) ,
        Restaurant(name: "惠灵顿雪梨", type: "美式 & 海鲜", location: "1/11-31 York Street Sydney NSW Australia、Sydney NSW 2000", image: "palominoespresso.jpg", isVisited: false) ,
        Restaurant(name: "北州", type: "美式", location: "Macy's、151 W 34th St Fifth Floor、New York, NY 10001", image: "upstate.jpg", isVisited: false) ,
        Restaurant(name: "布鲁克林塔菲", type: "美式", location: "250 8th Ave、New York, NY 10107", image: "traif.jpg", isVisited: false) ,
        Restaurant(name: "格雷厄姆大街肉", type: "早餐 & 早午餐", location: "55-1 Riverwalk Pl、West New York, NJ 07093", image: "grahamavenuemeats.jpg", isVisited: false) ,
        Restaurant(name: "华夫饼 & 沃夫", type: "法式 & 茶", location: "1585 Broadway、New York, NY 10036-8200", image: "wafflewolf.jpg", isVisited: false) ,
        Restaurant(name: "五叶", type: "咖啡 & 茶", location: "1460 Broadway、New York, NY 10036", image: "fiveleaves.jpg", isVisited: false) ,
        Restaurant(name: "眼光咖啡", type: "拉丁美式", location: "250 8th Ave、New York, NY 10107", image: "cafelore.jpg", isVisited: false) ,
        Restaurant(name: "忏悔", type: "西班牙式", location: "822 Lexington Ave、New York, NY 10065", image: "confessional.jpg", isVisited: false) ,
        Restaurant(name: "巴拉菲娜", type: "西班牙式", location: "Unit 2, Eldon Chambers、30-32 Fleet St、London EC4Y 1AA", image: "barrafina.jpg", isVisited: false) ,
        Restaurant(name: "多尼西亚", type: "西班牙式", location: "Waterloo Station、London SE1 7LY", image: "donostia.jpg", isVisited: false) ,
        Restaurant(name: "皇家橡树", type: "英式", location: "Unit 4a、44-58 Brompton Rd、London SW3 1BW", image: "royaloak.jpg", isVisited: false) ,
        Restaurant(name: "泰咖啡", type: "泰式", location: "7-9 Golders Green Rd、London NW11 8DY", image: "thaicafe.jpg", isVisited: false)

]
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)

        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        
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
        return restaurants.count
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

        cell.restaurantImage.image = UIImage(named: restaurants[indexPath.row].image)
        cell.restaurantName.text = restaurants[indexPath.row].name
        
        //图片圆角化
        cell.restaurantImage.layer.cornerRadius = cell.restaurantImage.frame.size.width / 2
        //使layer设置生效
        cell.restaurantImage.clipsToBounds = true
        cell.restaurantLocation.text = restaurants[indexPath.row].location
        cell.restaurantType.text = restaurants[indexPath.row].type
        
        
        
         
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
            
            self.restaurants.removeAtIndex(indexPath.row)
            
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
            
            let destVC = segue.destinationViewController as! DetailTableViewController
            
            destVC.restaurant = restaurants[tableView.indexPathForSelectedRow!.row]
            
            
        }
    }
}
