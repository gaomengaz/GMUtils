//
//  BaseViewController.m
//  GMUtils
//
//  Created by gm on 2016/11/16.
//  Copyright © 2016年 gm. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property(nonatomic,strong)UIBarButtonItem *leftButtonItem;//左
@property(nonatomic,strong)UIButton *leftButton;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpdateParamsBlock:(UpdateParamsBlock)updateParamsBlock{
    _updateParamsBlock = updateParamsBlock;
}


-(void)setMyVcLeftBtnType:(MyVcLeftBtnType)leftType rightBtnType:(MyVcRightBtnType)rightType{
    if (leftType == MyVcLeftBtnType_null) {
        
    }else if (leftType == MyVcLeftBtnType_back){
        //调整与左边的间距
        UIBarButtonItem * spaceButton1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        spaceButton1.width = -7;
        self.navigationItem.leftBarButtonItems = @[spaceButton1, self.leftButtonItem];
    }else if (leftType == MyVcLeftBtnType_text){
        
    }else if (leftType == MyVcLeftBtnType_double){
        
    }
    
    if (rightType == MyVcRightBtnType_null) {
        
    }else if (rightType == MyVcRightBtnType_text){
        
    }else if (rightType == MyVcRightBtnType_img){
        
    }else if (rightType == MyVcRightBtnType_double){
        
    }
}


#pragma mark setter
-(void)setMyTitle:(NSString *)myTitle{
    self.myTitleLabel.text = myTitle;
}


#pragma mark - getter

-(UILabel*)myTitleLabel{
    if (!_myTitleLabel) {
        _myTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,100,44)];
        _myTitleLabel.textAlignment = NSTextAlignmentCenter;
        _myTitleLabel.textColor = DEFAULT_TEXTCOLOR;
        _myTitleLabel.font = [UIFont systemFontOfSize:17];
        self.navigationItem.titleView = _myTitleLabel;
    }
    return _myTitleLabel;
}


-(UIBarButtonItem *)leftButtonItem
{
    if (!_leftButtonItem) {
        _leftButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftButton];
    }
    return _leftButtonItem;
}

-(UIButton *)leftButton
{
    if (!_leftButton) {
        
        UIButton *button_back=[[UIButton alloc]initWithFrame:CGRectMake(0,8,20,44)];
        [button_back addTarget:self action:@selector(leftButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [button_back setImage:BACK_DEFAULT_IMAGE forState:UIControlStateNormal];
        [button_back setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        _leftButton = button_back;
    }
    return _leftButton;
}

-(void)leftButtonTap:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
