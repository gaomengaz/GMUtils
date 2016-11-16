//
//  DirectoryViewController.m
//  GMUtils
//
//  Created by gaomeng on 16/8/17.
//  Copyright © 2016年 gaomeng. All rights reserved.
//

#import "DirectoryViewController.h"
#import "DateBaseViewController.h"

@interface DirectoryViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tab;
    NSArray *_dataArray;
}
@end

@implementation DirectoryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s",__FUNCTION__);
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myTitle = @"目录";
    [self setMyVcLeftBtnType:MyVcLeftBtnType_null rightBtnType:MyVcRightBtnType_null];
    
    [self creatTab];
    [self getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 视图创建
-(void)creatTab{
    _tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT) style:UITableViewStylePlain];
    _tab.delegate = self;
    _tab.dataSource = self;
    [self.view addSubview:_tab];
}

#pragma mark - 获取数据
-(void)getData{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"DirectoryList" ofType:@"plist"];
    _dataArray = [NSArray arrayWithContentsOfFile:path];
    [_tab reloadData];
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 44;
    return height;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat height = 0.01;
    return height;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CGFloat height = 0.01;
    return height;
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
    return view;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger num = _dataArray.count;
    return num;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_tab deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    if (indexPath.row == 0) {//DateBase
        
    }else if (indexPath.row == 1){
        
    }
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger num = 1;
    return num;
}




@end
