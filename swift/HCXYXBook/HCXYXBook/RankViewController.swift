//
//  RankViewController.swift
//  HCXYXBook
//
//  Created by sawyerhuang on 16/4/23.
//  Copyright © 2016年 sawyerhuang. All rights reserved.
//

import UIKit

class RankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let label = UILabel(frame: CGRectMake(0, 0, 200, 20))
        label.center = self.view.center
        label.textAlignment = NSTextAlignment.Center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: MY_FONT, size: 14)
        label.text = "hello world"
        label.textColor = UIColor.blackColor()
        self.view.addSubview(label)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
