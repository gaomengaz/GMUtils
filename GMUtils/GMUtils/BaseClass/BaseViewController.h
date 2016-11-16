//
//  BaseViewController.h
//  GMUtils
//
//  Created by gm on 2016/11/16.
//  Copyright © 2016年 gm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    MyVcLeftBtnType_null = 0,//无
    MyVcLeftBtnType_back,//返回
    MyVcLeftBtnType_text,//文字
    MyVcLeftBtnType_double,//左侧两个
}MyVcLeftBtnType;

typedef enum{
    MyVcRightBtnType_null = 0,//无
    MyVcRightBtnType_text,//文字
    MyVcRightBtnType_img,//图片
    MyVcRightBtnType_double,//右侧两个
}MyVcRightBtnType;

typedef void(^UpdateParamsBlock)(NSDictionary *params);

@interface BaseViewController : UIViewController

@property(nonatomic,strong)NSString *myTitle;//标题
@property(nonatomic,strong)UILabel *myTitleLabel;//标题label
@property(nonatomic,strong)UpdateParamsBlock updateParamsBlock;


-(void)setUpdateParamsBlock:(UpdateParamsBlock)updateParamsBlock;

-(void)setMyVcLeftBtnType:(MyVcLeftBtnType)leftType rightBtnType:(MyVcRightBtnType)rightType;

-(void)leftButtonTap:(UIButton *)sender;




@end
