//
//  DataBase.h
//  GMUtils
//
//  Created by gaomeng on 2016/11/14.
//  Copyright © 2016年 gaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DataBase : NSObject

//打开数据库
+(sqlite3 *)openDB;
//关闭数据库
+(void)closeDB;

+ (BOOL)removeDb;//直接移除数据库,不用删除表了

@end
