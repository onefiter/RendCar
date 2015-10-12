//
//  NSString+Addition.h
//  ZDBaseCode
//
//  Created by 杨志达 on 15/8/21.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)

/**
 *  md5
 *
 *  @param source 源字符串
 *
 *  @return md5后的字符串
 */
+ (NSString *)md5Hash:(NSString *)source;

/**
 *  货币千分位
 *
 *  @param number 需要转化的数字
 *  @param symbol 货币符号
 *
 *  @return 转化后的字符串
 */
+ (NSString *)getCurrency:(double)number symbol:(NSString *)symbol;

/**
 *  nil转化为@""
 *
 *  @param string 需要判断转化的值
 *
 *  @return 转化后
 */
+ (NSString *)nilToSpace:(NSString *)string;

@end
