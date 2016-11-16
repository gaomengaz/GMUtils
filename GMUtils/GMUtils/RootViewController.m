//
//  RootViewController.m
//  GMUtils
//
//  Created by gaomeng on 2016/11/1.
//  Copyright © 2016年 gaomeng. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self prepareItems];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareItems{
    NSArray *classNames = @[@"DirectoryViewController",@"MyInfoViewController"];
    NSMutableArray *classArray = [NSMutableArray arrayWithCapacity:classNames.count];
    for (int i = 0; i < classNames.count;i ++) {
        
        NSString *className = classNames[i];
        UIViewController *vc = [[NSClassFromString(className) alloc]init];
        UINavigationController *unvc = [[UINavigationController alloc]initWithRootViewController:vc];
        [classArray addObject:unvc];
    }
    self.viewControllers = classArray;
    
    
    NSArray *itemNames = @[@"Demo",@"MyInfo"];
    for (int i = 0; i < itemNames.count; i ++) {
        
        UITabBarItem *item = self.tabBar.items[i];
//        UIImage *aImage = [UIImage imageNamed:[normalImages objectAtIndex:i]];
//        aImage = [aImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        item.image = aImage;
//        UIImage *selectImage = [UIImage imageNamed:[selectedImages objectAtIndex:i]];
//        selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        item.selectedImage = selectImage;
        
        item.title = itemNames[i];
        
    }
    
}

@end
