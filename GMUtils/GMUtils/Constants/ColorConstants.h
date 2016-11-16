//
//  ColorConstants.h
//  GMUtils
//
//  Created by gaomeng on 16/8/11.
//  Copyright © 2016年 gaomeng. All rights reserved.
//

#ifndef ColorConstants_h
#define ColorConstants_h


///颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f \
alpha:(a)]

//随机颜色
#define RGBCOLOR_ONE RGBCOLOR(arc4random()%255, arc4random()%255, arc4random()%255)

/**
 *  自定义一些颜色
 */

#define DEFAULT_VIEW_BACKGROUNDCOLOR RGBCOLOR(245, 245, 245)
#define DEFAULT_TEXTCOLOR RGBCOLOR(125, 163, 208) //主题颜色一致 #7DA3D0
#define DEFAULT_LINECOLOR RGBCOLOR(226, 226, 226) //分割线颜色




#endif /* ColorConstants_h */
