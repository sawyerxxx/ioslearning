//
//  ViewController.m
//  Checklists
//
//  Created by sawyerhuang on 16/3/6.
//  Copyright © 2016年 sawyerhuang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController {
    NSString *_row0text;
    NSString *_row1text;
    NSString *_row2text;
    NSString *_row3text;
    NSString *_row4text;
    NSString *_row5text;
    NSString *_row6text;
    NSString *_row7text;
    NSString *_row8text;
    
    BOOL _row0checked;
    BOOL _row1checked;
    BOOL _row2checked;
    BOOL _row3checked;
    BOOL _row4checked;
    BOOL _row5checked;
    BOOL _row6checked;
    BOOL _row7checked;
    BOOL _row8checked;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _row0text = @"0";
    _row1text = @"1";
    _row2text = @"2";
    _row3text = @"3";
    _row4text = @"4";
    _row5text = @"5";
    _row6text = @"6";
    _row7text = @"7";
    _row8text = @"8";
     
    _row3checked = YES;
    _row5checked = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//需要显示多少行（多少个cell）
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

-(void)configureCheckmarkForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    BOOL isChecked = NO;
    
    if (indexPath.row == 0) {
        isChecked = _row0checked;
    }
    else if(indexPath.row == 1) {
        isChecked = _row1checked;
    }
    if(indexPath.row == 2) {
        isChecked = _row2checked;
    }
    if(indexPath.row == 3) {
        isChecked = _row3checked;
    }
    if(indexPath.row == 4) {
        isChecked = _row4checked;
    }
    if(indexPath.row == 5) {
        isChecked = _row5checked;
    }
    if(indexPath.row == 6) {
        isChecked = _row6checked;
    }
    if(indexPath.row == 7) {
        isChecked = _row7checked;
    }
    
    if (!isChecked) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

//为某一行数据获取一个cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    UILabel *label = [(UILabel*)cell viewWithTag:1024];
    
    if (indexPath.row == 0) {
        label.text = _row0text;
    }
    else if (indexPath.row == 1) {
        label.text = _row1text;
    }
    else if(indexPath.row == 2) {
        label.text = _row2text;
    }
    else if(indexPath.row == 3) {
        label.text = _row3text;
    }
    else if(indexPath.row == 4) {
        label.text = _row4text;
    }
    else if (indexPath.row == 5) {
        label.text = _row5text;
    }
    else if(indexPath.row == 6) {
        label.text = _row6text;
    }
    else if (indexPath.row == 7) {
        label.text = _row7text;
    }
    
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];

  
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    BOOL isChecked = NO;
    
    if (indexPath.row == 0) {
//        isChecked = _row0checked;
        _row0checked = !_row0checked;
    }
    else if(indexPath.row == 1) {
//        isChecked = _row1checked;
        _row1checked = !_row1checked;
    }
    if(indexPath.row == 2) {
//        isChecked = _row1checked;
        _row2checked = !_row2checked;
    }
  if(indexPath.row == 3) {
//        isChecked = _row3checked;
        _row3checked = !_row3checked;
    }
    if(indexPath.row == 4) {
//        isChecked = _row4checked;
        _row4checked = !_row4checked;
    }
    if(indexPath.row == 5) {
//        isChecked = _row5checked;
        _row5checked = !_row5checked;
    }
    if(indexPath.row == 6) {
//        isChecked = _row6checked;
        _row6checked = !_row6checked;
    }
    if(indexPath.row == 7) {
//        isChecked = _row7checked;
        _row7checked = !_row7checked;
    }
//    
//    if (isChecked) {
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
//    else {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    }
//
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

/*点击某一行 背景快速变灰及恢复
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
*/
}






    @end
