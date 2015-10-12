//
//  UIColor+Addition.h
//  ZDBaseCode
//
//  Created by 杨志达 on 15/8/21.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Addition)

/**
 *  十六进制取色
 */
+ (UIColor *)colorWithValue:(NSUInteger)value;

/**
 *  RGBA取色
 */
+ (UIColor *)colorR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B A:(CGFloat)A;

@end
