//
//  DetailTableViewController.swift
//  FoodPin
//
//  Created by sawyerhuang on 16/5/22.
//  Copyright © 2016年 sawyerhuang. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var restaurant: Restaurant!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: restaurant.image)
        
        tableView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        //移除空行的分隔线
        tableView.tableFooterView = UIView(frame: CGRectZero)
        //淡化分隔线颜色
        tableView.separatorColor = UIColor(white: 0.9, alpha: 1)
        
        title = restaurant.name 
        
        //启用自适应
        tableView.estimatedRowHeight = 36
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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath) as! DetailTableViewCell

        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "餐馆名"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "类型"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "地点"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "是否来过"
            cell.valueLabel.text = restaurant.isVisited ? "来过" : "没来过"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        //单元格背景透明
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
