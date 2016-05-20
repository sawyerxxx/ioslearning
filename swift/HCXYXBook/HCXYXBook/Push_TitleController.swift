//
//  Push_TitleController.swift
//  HCXYXBook
//
//  Created by sawyerhuang on 16/4/29.
//  Copyright © 2016年 sawyerhuang. All rights reserved.
//

import UIKit

typealias Push_TitleCallBack = (Title:String) -> Void

class Push_TitleController: UIViewController {

    var textField:UITextField?
    var callBack:Push_TitleCallBack?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.textField = UITextField(frame: CGRect(x: 15, y: 60, width: SCREEN_WIDTH - 30, height: 30))
        self.textField?.borderStyle = .RoundedRect
        self.textField?.placeholder = "书评标题" //返回提示语句
        self.textField?.font = UIFont(name: MY_FONT, size: 15)
        self.view.addSubview(self.textField!)

        self.textField?.becomeFirstResponder()  //响应textfield 会直接跳出键盘
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func sure() {
        self.callBack?(Title: self.textField!.text!)
    }
    
    func close() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

}
