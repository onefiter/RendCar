//
//  UIScreen+Addition.m
//  ZDBaseCode
//
//  Created by 杨志达 on 15/8/21.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import "UIScreen+Addition.h"

@implementation UIScreen (Addition)

+ (CGFloat)width
{
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)height
{
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)scaleWith320:(CGFloat)num
{
    return num * 320.0f/[UIScreen mainScreen].bounds.size.width;
}

@end
