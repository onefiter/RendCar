//
//  BaseRequest.h
//  BCar
//
//  Created by WillDeng on 15/9/1.
//  Copyright (c) 2015年 eggeggs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking.h>

#import "BCConfigurations.h"

@interface BaseRequest : NSObject

+ (AFHTTPRequestOperationManager *)requestManager;

@end
