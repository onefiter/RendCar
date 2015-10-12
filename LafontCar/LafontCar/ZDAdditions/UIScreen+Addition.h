//
//  UIScreen+Addition.h
//  ZDBaseCode
//
//  Created by 杨志达 on 15/8/21.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (Addition)

+ (CGFloat)width;

+ (CGFloat)height;

/**
 *  以320像素为标准进行缩放
 *
 *  @param num 缩放前数值
 *
 *  @return 缩放后数值
 */
+ (CGFloat)scaleWith320:(CGFloat)num;

@end


