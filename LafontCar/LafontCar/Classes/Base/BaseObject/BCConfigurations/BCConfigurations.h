//
//  BCConfigurations.h
//  BCar
//
//  Created by WillDeng on 15/9/1.
//  Copyright (c) 2015年 eggeggs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BCConfigurationDefines.h"

@interface BCConfigurations : NSObject

+ (NSInteger)userType;

+ (NSString *)channel;

+ (NSDictionary *)requestHeaders;

@end
