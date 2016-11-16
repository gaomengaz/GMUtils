//
//  UIView+Utils.h
//  GMUtils
//
//  Created by gaomeng on 16/8/19.
//  Copyright © 2016年 gaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utils)

- (CGFloat)left;
- (void)setLeft:(CGFloat)x;

- (CGFloat)top;
- (void)setTop:(CGFloat)y;

- (CGFloat)right;
- (void)setRight:(CGFloat)right;

- (CGFloat)bottom;
- (void)setBottom:(CGFloat)bottom;

- (CGFloat)centerX;
- (void)setCenterX:(CGFloat)centerX;

- (CGFloat)centerY;
- (void)setCenterY:(CGFloat)centerY;

- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

- (CGPoint)origin;
- (void)setOrigin:(CGPoint)origin;

- (CGSize)size;
- (void)setSize:(CGSize)size;

@end
