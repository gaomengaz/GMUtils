//
//  AppConstants.h
//  GMUtils
//
//  Created by gaomeng on 16/8/11.
//  Copyright © 2016年 gaomeng. All rights reserved.
//

#ifndef AppConstants_h
#define AppConstants_h

///屏幕宽度
#define DEVICE_WIDTH  [UIScreen mainScreen].bounds.size.width
///屏幕高度
#define DEVICE_HEIGHT [UIScreen mainScreen].bounds.size.height

//BunleIdentifier
#define AppBunleIdentifier [[NSBundle mainBundle] bundleIdentifier]
//系统9.0之后
#define IOS9_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != NSOrderedAscending )
//系统8.0之后
#define IOS8_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
//系统7.0之后
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6PLUS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//============================== 打印类、方法
#pragma mark - Debug log macro
//start
#ifdef DEBUG
#define DDLOG( s , ...) NSLog( @"%@(%d):<%@> %@",[[NSString stringWithUTF8String:__FILE__] lastPathComponent],__LINE__,NSStringFromSelector(_cmd),[NSString stringWithFormat:(s), ##__VA_ARGS__] )
//#define DDLOG( s , ...) NSLog( @"<%@:(%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#define DDLOG_CURRENT_METHOD NSLog(@"%@-%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))
#else
#define DDLOG(...) ;
#define DDLOG_CURRENT_METHOD ;
#endif
//============================== end

//适配6 PLUS 放大1.2倍
#define FitScreen(a) (iPhone6PLUS ? a * 1.2 : a)

//根视图
#define ROOTVIEWCONTROLLER (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController

//图片比例
#define W_H_RATIO 200.f/320
//计算BMI
#define BMI(weight,height) (weight / powf(height * 0.01, 2))

//int 转 string
#define NSStringFromFloat(float) [NSString stringWithFormat:@"%f",(float)]
#define NSStringFromInt(int) [NSString stringWithFormat:@"%d",(int)]

//weak && strong
#pragma mark - weak 和 strong
#define WeakObj(o) autoreleasepool{} __weak typeof(o) Weak##o = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

//分页网络请求
#define G_PER_PAGE 10
#define PAGESIZE_BIG 50 //根据需求选择不同页size
#define PAGESIZE_MID 20
#define PAGESIZE_SMALL 10





#endif /* AppConstants_h */
