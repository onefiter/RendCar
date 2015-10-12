//
//  BaseEntity.m
//  BCar
//
//  Created by WillDeng on 15/9/1.
//  Copyright (c) 2015年 eggeggs. All rights reserved.
//

#import "BaseEntity.h"

@implementation BaseEntity

- (instancetype)initWithDictionary:(NSDictionary *)dict;
{
    self = [super init];
    
    if (self)
    {
        self.statusCode = [dict valueForKey:@"status_code"];
        
        self.msg = [NSString nilToSpace:[dict valueForKey:@"msg"]];
        
        if ([_statusCode isEqualToNumber:[NSNumber numberWithInt:200]])
        {
            self.isSuccessed = YES;
        }
        else
        {
            self.isSuccessed = NO;
        }
    }
    
    return self;
}

@end
