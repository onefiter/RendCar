//
//  BCConfigurations.m
//  BCar
//
//  Created by WillDeng on 15/9/1.
//  Copyright (c) 2015年 eggeggs. All rights reserved.
//

#import "BCConfigurations.h"

#import "BCGlobalEntity.h"

/**
 *  用户类型
 */
typedef NS_ENUM(NSUInteger, BCUserType){
    /**
     *  司机
     */
    BCUserTypeDriver = 1,
    /**
     *  乘客
     */
    BCUserTypePassengers,
};

@implementation BCConfigurations

+ (NSInteger)userType
{
    return BCUserTypePassengers;
}

+ (NSString *)channel
{
    return @"AppStore";
}

+ (NSDictionary *)requestHeaders
{
    NSString *sysname   = [UIDevice systemInfoSysname];
    
    NSString *os        = UIDevice.currentDevice.systemVersion;
    
    NSString *channel   = [NSString nilToSpace:[BCConfigurations channel]];
    
    NSString *uuid      = [NSString nilToSpace:[UIDevice uuidWithUser:kDeviceUUIDKey serviceName:kDeviceUUIDServiceKey]];

    NSString *version   = [NSString nilToSpace:BCCFBundleShortVersionString];

    NSString *token     = [NSString nilToSpace:[BCGlobalEntity globalEntity].token];
    
    NSString *user_id   = [NSString nilToSpace:[BCGlobalEntity globalEntity].user_id];
    
    NSString *gps_lng   = [NSString nilToSpace:[BCGlobalEntity globalEntity].gps_lng];

    NSString *gps_lat   = [NSString nilToSpace:[BCGlobalEntity globalEntity].gps_lat];

    NSString *hardware_type   = [UIDevice systemInfoMachine];

    NSString *ua = [NSString stringWithFormat:@"%@/%@ (os=%@%@;hardware_type=%@;channel=%@;uuid=%@;version=%@;token=%@;user_id=%@;gps_lng=%@;gps_lat=%@;)",sysname,os,sysname,os,hardware_type,channel,uuid,version,token,user_id,gps_lng,gps_lat];
    
    ZDLog(@"%@",ua);
    
    return @{@"User-Agent": ua};
}

@end
