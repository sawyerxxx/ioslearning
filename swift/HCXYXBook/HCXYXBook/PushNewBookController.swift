//
//  PushNewBookController.swift
//  HCXYXBook
//
//  Created by sawyerhuang on 16/4/24.
//  Copyright © 2016年 sawyerhuang. All rights reserved.
//

import UIKit

class PushNewBookController: UIViewController, BookTitleDelegate, PhotoPickerDelegate,VPImageCropperDelegate, UITableViewDelegate, UITableViewDataSource {

    var BookTitle:BookTitleView?
    var tableView:UITableView?
    var titleArray:Array<String> = []
    var Book_Title = ""
    var Score:LDXScore?
    var showScore = false  //是否显示星星
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.BookTitle = BookTitleView(frame: CGRectMake(0, 40, SCREEN_WIDTH, 160))
        self.BookTitle?.delegate = self
        self.view.addSubview(self.BookTitle! )
        
        self.tableView = UITableView(frame: CGRectMake(0, 200, SCREEN_WIDTH, SCREEN_HEIGHT - 200), style: .Grouped)
        self.tableView?.tableFooterView = UIView() //使没有内容的线条消失
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell") //classforcoder啥东西
        self.tableView?.backgroundColor = UIColor(colorLiteralRed: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        self.view.addSubview(self.tableView!)//啥时候要用self.
        
        self.titleArray = ["标题", "评分", "分类", "书评"]
        
        self.Score = LDXScore(frame: CGRectMake(100, 10, 100, 22))
        self.Score?.isSelect = true
        self.Score?.normalImg = UIImage(named: "btn_star_evaluation_normal")
        self.Score?.highlightImg = UIImage(named: "btn_star_evaluation_press")
        self.Score?.max_star = 5
        self.Score?.show_star = 5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("pushNewBookController")
    }
    
    func chooseCover() {
        let vc = PhotoPickerViewController()
        vc.delegate = self
        self.presentViewController(vc, animated: true) { () -> Void in
            
        }
    }
    
    /**
     PhotoPickerDelegate
     */
    func getImageFromPicker(image: UIImage) {
        let CroVc = VPImageCropperViewController(image: image, cropFrame: CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_WIDTH * 1.273), limitScaleRatio: 3)
        CroVc.delegate = self
        self.presentViewController(CroVc, animated: true) { () -> Void in
    
        }
    }
    
    
    func close() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
 
    
    func sure() {
        
    }
    
    func imageCropper(cropperViewController: VPImageCropperViewController!, didFinished editedImage: UIImage!) {
        self.BookTitle?.BookCover?.setImage(editedImage, forState: .Normal)
        cropperViewController.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    func imageCropperDidCancel(cropperViewController: VPImageCropperViewController!) {
        cropperViewController.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

    //UITableViewdelegate datasource的一些必须要实现的方法
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell") //这样初始化左边有个title 右边有个detail的label
      //  let celll = self.tableView?.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)//这样初始化默认是没有东西的
       /*
         写tableview必须的动作 每次使用cell前清除之前所有内容 之后再添加 因为cell是重用的
        */
        for view in cell.contentView.subviews {
            cell.removeFromSuperview()
        }
        
        if(indexPath.row != 1) {
            cell.accessoryType = .DisclosureIndicator//disclosureIndicator啥东西 右边有个小剪头？
        }
        cell.textLabel?.text = self.titleArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: MY_FONT, size: 15)
        cell.detailTextLabel?.font = UIFont(name: MY_FONT, size: 13)
        switch indexPath.row {
        case 0:
            cell.detailTextLabel?.text = self.Book_Title
        default:
            break
        }
        if self.showScore && indexPath.row == 2 {
            cell.contentView.addSubview(self.Score!)
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var row = indexPath.row
        
        self.tableView?.deselectRowAtIndexPath(indexPath, animated: true)
        
        if showScore && row >= 1 {
            row -= 1
        }
        switch row {
        case 0:
            self.tableViewSelectTitle()
        case 1:
            self.tableViewSelectScore()
        case 2:
            self.tableViewSelectType()
        case 3:
            self.tableViewSelectDescription()
        default:
            break
        }
    }
    
    /*
     选择标题
    */
    func tableViewSelectTitle() {
        let vc = Push_TitleController()
        GeneralFactory.addTitleWithTitle(vc)
        vc.callBack = ({(Title:String) -> Void in
            self.Book_Title = Title
            self.tableView?.reloadData()
            })
        self.presentViewController(vc, animated: true) { () -> Void in

        }
    }
    
    /* 
     选择评分
    */
    func tableViewSelectScore() {
        self.tableView?.beginUpdates()
        let tempIndexPath = [NSIndexPath(forRow: 2, inSection: 0)]
        
        if self.showScore {
            self.titleArray.removeAtIndex(2)
            self.tableView?.deleteRowsAtIndexPaths(tempIndexPath, withRowAnimation: .Right)
            self.showScore = false
        } else {
            self.titleArray.insert("", atIndex: 2)
            self.tableView?.insertRowsAtIndexPaths(tempIndexPath, withRowAnimation: .Left)
            self.showScore = true
        }
    
        self.tableView?.endUpdates()
    }
    
    /*
    选择分类
    */
    func tableViewSelectType() {
        let vc = Push_TypeController()
        GeneralFactory.addTitleWithTitle(vc)
        let btn1 = vc.view.viewWithTag(1234) as? UIButton
        let btn2 = vc.view.viewWithTag(1235) as? UIButton
        btn1?.setTitleColor(RGB(38, g: 82, b: 67), forState: .Normal)
        btn2?.setTitleColor(RGB(38, g: 82, b: 67), forState: .Normal)

        self.presentViewController(vc, animated: true) { () -> Void in
  
        }
    }
    /*
     选择书评
    */
    func tableViewSelectDescription() {
        let vc = Push_DescriptionController()
        GeneralFactory.addTitleWithTitle(vc)
        self.presentViewController(vc, animated: true) { () -> Void in

        }
    }
}
