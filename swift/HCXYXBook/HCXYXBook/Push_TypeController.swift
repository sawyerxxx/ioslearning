//
//  Push_TypeController.swift
//  HCXYXBook
//
//  Created by sawyerhuang on 16/4/29.
//  Copyright © 2016年 sawyerhuang. All rights reserved.
//

import UIKit

class Push_TypeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func sure() {
        
    }
    
    func close() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

}
