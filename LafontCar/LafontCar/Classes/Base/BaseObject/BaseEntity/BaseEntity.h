//
//  BaseEntity.h
//  BCar
//
//  Created by WillDeng on 15/9/1.
//  Copyright (c) 2015年 eggeggs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseRequest.h"

@interface BaseEntity : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@property (nonatomic, assign) BOOL isSuccessed;

@property (nonatomic, strong) NSNumber *statusCode;

@property (nonatomic, copy) NSString *msg;

@end
