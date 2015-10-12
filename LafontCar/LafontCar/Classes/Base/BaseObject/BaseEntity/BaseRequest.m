//
//  BaseRequest.m
//  BCar
//
//  Created by WillDeng on 15/9/1.
//  Copyright (c) 2015年 eggeggs. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

static AFHTTPRequestOperationManager *_manager = nil;

+ (AFHTTPRequestOperationManager *)requestManager
{
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{

        _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:BC_HOST_URL]];

        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
    });

    [BaseRequest manager:_manager setHeaders:[BCConfigurations requestHeaders]];

    return _manager;
}

+ (void)manager:(AFHTTPRequestOperationManager *)manager setHeaders:(NSDictionary *)headers
{
    NSArray *keys = [headers allKeys];
    
    for (NSString *key in keys)
    {
        NSString *value = [headers valueForKey:key];
        
        [manager.requestSerializer setValue:value forHTTPHeaderField:key];
    }
}


@end
