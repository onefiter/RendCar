//
//  UIDevice+Addition.m
//  ZDBaseCode
//
//  Created by 杨志达 on 15/8/21.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import "UIDevice+Addition.h"

#import "sys/utsname.h"

#import "SFHFKeychainUtils.h"

@implementation UIDevice (Addition)

#pragma mark - 硬件类型
+ (BOOL)iPhone
{
    return ([UIDevice.currentDevice.model isEqualToString:@"iPhone"] || [UIDevice.currentDevice.model isEqualToString:@"iPhone Simulator"]);
}

+ (BOOL)iPodTouch
{
    return [UIDevice.currentDevice.model isEqualToString:@"iPod touch"];
}

+ (BOOL)iPad
{
    return ([UIDevice.currentDevice.model isEqualToString:@"iPad"] || [UIDevice.currentDevice.model isEqualToString:@"iPad Simulator"]);
}

+ (NSString *)systemInfoMachine
{
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

+ (NSString *)systemInfoSysname
{
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.sysname encoding:NSUTF8StringEncoding];
}

+ (NSString *)systemInfoNodename
{
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.nodename encoding:NSUTF8StringEncoding];
}

+ (NSString *)uuidWithUser:(NSString *)userName serviceName:(NSString *)serviceName
{
    // 从keychain中读取id
    NSString *uuid = [SFHFKeychainUtils getPasswordForUsername:userName
                                                andServiceName:serviceName
                                                         error:nil];
    if (uuid.length == 0)
    {
        
        uuid = [NSString md5Hash:[UIDevice currentDevice].identifierForVendor.UUIDString];
        
        [SFHFKeychainUtils storeUsername:userName
                             andPassword:uuid
                          forServiceName:serviceName
                          updateExisting:YES
                                   error:nil];
    }
    
    return uuid;
}


#pragma mark - 系统版本
+ (BOOL)iOS8
{
    return UIDevice.currentDevice.systemVersion.intValue == 8;
}

+ (BOOL)iOS8Later
{
    return UIDevice.currentDevice.systemVersion.intValue >= 8;
}

+ (BOOL)iOS7
{
    return UIDevice.currentDevice.systemVersion.intValue == 7;
}

+ (BOOL)iOS7Later
{
    return UIDevice.currentDevice.systemVersion.intValue >= 7;
}

+ (BOOL)iOS6
{
    return UIDevice.currentDevice.systemVersion.intValue == 6;
}

+ (BOOL)iOS6Later
{
    return UIDevice.currentDevice.systemVersion.intValue >= 6;
}

+ (BOOL)iOS5
{
    return UIDevice.currentDevice.systemVersion.intValue == 5;
}

+ (BOOL)iOS5Later
{
    return UIDevice.currentDevice.systemVersion.intValue >= 5;
}

+ (BOOL)iOS5Before
{
    return UIDevice.currentDevice.systemVersion.intValue < 5;
}

#pragma mark - 语言
+ (BOOL)languagesChinese
{
    return [[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"];
}

+ (BOOL)languagesEnglish
{
    return [[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"en"];
}

@end
