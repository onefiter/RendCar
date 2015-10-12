//
//  UIColor+Addition.m
//  ZDBaseCode
//
//  Created by 杨志达 on 15/8/21.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import "UIColor+Addition.h"

@implementation UIColor (Addition)

+ (UIColor *)colorWithValue:(NSUInteger)value
{
    CGFloat B = (value & 0x000000FF)/255.0;

    CGFloat G = ((value & 0x0000FF00) >> 8)/255.0;

    CGFloat R = ((value & 0x00FF0000) >> 16)/255.0;
    
    CGFloat A = ((value & 0xFF000000) >> 24)/255.0;
    
    return [UIColor colorWithRed:R green:G blue:B alpha:A];
}

+ (UIColor *)colorR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B A:(CGFloat)A
{
    return [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A];
}

@end
