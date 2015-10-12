//
//  NSObject+Addition.m
//  ZDBaseCode
//
//  Created by 杨志达 on 15/8/21.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import "NSObject+Addition.h"

@implementation NSObject (Addition)

+ (NSString *)nullToNil:(id)obj
{
    if ([obj isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    else
    {
        return obj;
    }
}

@end
