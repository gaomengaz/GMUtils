//
//  GMAPI.m
//  TiJian
//
//  Created by gaomeng on 15/11/3.
//  Copyright © 2015年 lcw. All rights reserved.
//

#import "GMAPI.h"

@implementation GMAPI


//时间转换 —— 年-月-日
+(NSString *)timechangeYMD:(NSString *)placetime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[placetime doubleValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

//时间转换 —— 月-日
+(NSString *)timechangeMD:(NSString *)placetime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM-dd"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[placetime doubleValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

//HH:mm:ss
+(NSString *)timechangeYMDhms:(NSString *)placetime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[placetime doubleValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}




//地区选择相关

/**
 *  根据name找id
 *
 *  @param cityName 省份str或城市str
 *
 *  @return 对应id
 */
+ (int)cityIdForName:(NSString *)cityName//根据城市名获取id
{
    //打开数据库
    sqlite3 *db = [DataBase openDB];
    //创建操作指针
    sqlite3_stmt *stmt = nil;
    //执行SQL语句
    int result = sqlite3_prepare_v2(db, "select * from area where name = ?", -1, &stmt, nil);
    
    if (result == SQLITE_OK) {
        
        sqlite3_bind_text(stmt, 1, [cityName UTF8String], -1, nil);
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            
            int cityId = sqlite3_column_int(stmt, 1);
            
            return cityId;
        }
    }
    sqlite3_finalize(stmt);
    return 0;
}

/**
 *  根据id找name
 *
 *  @param cityId 城市id或者省份id
 *
 *  @return name
 */
+ (NSString *)cityNameForId:(int)cityId{
    //打开数据库
    sqlite3 *db = [DataBase openDB];
    //创建操作指针
    sqlite3_stmt *stmt = nil;
    //执行SQL语句
    int result = sqlite3_prepare_v2(db, "select * from area where id = ?", -1, &stmt, nil);
    
//    NSLog(@"All subcities result = %d %d",result,cityId);
    
    if (result == SQLITE_OK) {
        
        sqlite3_bind_int(stmt, 1, cityId);
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            
            const unsigned char *cityName = sqlite3_column_text(stmt, 0);
            
            return [NSString stringWithUTF8String:(const char *)cityName];
        }
    }
    sqlite3_finalize(stmt);
    return @"";
}




//获取appdelegate
+ (AppDelegate *)appDeledate
{
    AppDelegate *aa = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return aa;
}


//地图相关

+ (GMAPI *)sharedManager
{
    static GMAPI *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}


//NSUserDefault存
+ (void)cache:(id)dataInfo ForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    @try {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:nil forKey:key];
        [defaults setObject:dataInfo forKey:key];
        [defaults synchronize];
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"exception %@",exception);
        
    }
    @finally {
        
    }
}

//NSUserDefault删除
+ (void)deleteCacheForKey:(NSString *)key
{
    NSLog(@"key===%@",key);
    @try {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults removeObjectForKey:key];
        [defaults synchronize];
    }
    @catch (NSException *exception) {
        NSLog(@"exception %@",exception);
    }
    @finally {
    }
}




//NSUserDefault取
+ (id)cacheForKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}


+(NSString*)getProvineIdWithCityId:(int)cityId{
    
    NSString *provinceId = [NSString stringWithFormat:@"%d00",cityId/100];
    return provinceId;
}

+(NSString *)getCityNameOf4CityWithCityId:(int)cityId{
    
    NSString *city_name = [self cityNameForId:cityId];
    
    if (cityId < 1400) {
        NSString *p_id = [self getProvineIdWithCityId:cityId];
        city_name = [self cityNameForId:[p_id intValue]];
        
    }else{
        city_name = [self cityNameForId:cityId];
    }

    return city_name;
}




//判断是否为整形：
+ (BOOL)isPureInt:(NSString*)string{
    
    NSScanner* scan = [NSScanner scannerWithString:string];
    
    int val;
    
    return[scan scanInt:&val] && [scan isAtEnd];
    
}


//判断是否为浮点形：
+ (BOOL)isPureFloat:(NSString*)string{
    
    NSScanner* scan = [NSScanner scannerWithString:string];
    
    float val;
    
    return[scan scanFloat:&val] && [scan isAtEnd];
    
}

//是否为数字
+(BOOL)isPureNum:(NSString*)string{
    
    BOOL bb = NO;
    
    if ([self isPureInt:string] || [self isPureFloat:string]) {
        bb = YES;
    }
    
    return bb;
}






@end
