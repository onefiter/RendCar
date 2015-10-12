//
//  UIDevice+Addition.h
//  ZDBaseCode
//
//  Created by 杨志达 on 15/8/21.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Addition)

#pragma mark - 设备信息
+ (BOOL)iPhone;

+ (BOOL)iPodTouch;

+ (BOOL)iPad;

+ (NSString *)systemInfoMachine;    //硬件类型

+ (NSString *)systemInfoSysname;    //软件类型

+ (NSString *)systemInfoNodename;   //用户手机名称

+ (NSString *)uuidWithUser:(NSString *)userName serviceName:(NSString *)serviceName; //手机标示符

+ (BOOL)iOS8;

+ (BOOL)iOS8Later;

+ (BOOL)iOS7;

+ (BOOL)iOS7Later;

+ (BOOL)iOS6;

+ (BOOL)iOS6Later;

+ (BOOL)iOS5;

+ (BOOL)iOS5Later;

+ (BOOL)iOS5Before;

#pragma mark - 语言
+ (BOOL)languagesChinese;

+ (BOOL)languagesEnglish;

@end
