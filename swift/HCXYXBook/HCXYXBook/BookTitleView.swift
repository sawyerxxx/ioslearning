//
//  BookTitleView.swift
//  HCXYXBook
//
//  Created by sawyerhuang on 16/4/25.
//  Copyright © 2016年 sawyerhuang. All rights reserved.
//

import UIKit

@objc protocol BookTitleDelegate {
    optional func chooseCover()
}

class BookTitleView: UIView {

    var BookCover: UIButton?
    var BookName: JVFloatLabeledTextField?
    var BookEditor: JVFloatLabeledTextField?
    weak var delegate:BookTitleDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.BookCover = UIButton(frame: CGRectMake(10, 8, 110, 141))
        self.BookCover?.setImage(UIImage(named: "Cover"), forState: .Normal)
        self.addSubview(self.BookCover!)
        self.BookCover?.addTarget(self, action: Selector("chooseCover"), forControlEvents: .TouchUpInside)
     
        self.BookName = JVFloatLabeledTextField(frame: CGRectMake(128, 8 + 40, SCREEN_WIDTH - 128 - 15, 30))
        self.BookEditor = JVFloatLabeledTextField(frame: CGRectMake(128, 8 + 70 + 40, SCREEN_WIDTH - 128 - 15, 30))
        self.BookName?.placeholder = " 书名"
        self.BookEditor?.placeholder = "作者"
        self.BookName?.floatingLabelFont = UIFont(name: MY_FONT, size: 14)
        self.BookEditor?.floatingLabelFont = UIFont(name: MY_FONT, size: 14)
        self.BookName?.font = UIFont(name: MY_FONT, size: 14)
        self.BookEditor?.font = UIFont(name: MY_FONT, size: 14)
        
        self.addSubview(self.BookName!)
        self.addSubview(self.BookEditor!)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder): has not impleted")
    }
    
    func chooseCover() {
        self.delegate?.chooseCover!()
    }
    

}
