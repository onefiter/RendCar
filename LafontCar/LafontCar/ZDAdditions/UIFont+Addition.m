//
//  UIFont+Addition.m
//  ZDBaseCode
//
//  Created by 杨志达 on 15/8/21.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import "UIFont+Addition.h"

@implementation UIFont (Addition)

+ (UIFont *)defaultWithSize:(CGFloat)size
{
    return [self systemFontOfSize:FIT_320_SCREEN(size)];
}

@end
