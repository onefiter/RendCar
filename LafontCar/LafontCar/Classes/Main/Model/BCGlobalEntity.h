//
//  BCGlobalEntity.h
//  BCar
//
//  Created by 杨志达 on 15/9/1.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import "BaseEntity.h"

@interface BCGlobalEntity : BaseEntity

@property (nonatomic, copy) NSString *token;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *gps_lng; //经度

@property (nonatomic, copy) NSString *gps_lat; //纬度

+ (BCGlobalEntity *)globalEntity;

- (void)clearData;

@end
