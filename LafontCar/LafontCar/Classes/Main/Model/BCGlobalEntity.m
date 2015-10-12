//
//  BCGlobalEntity.m
//  BCar
//
//  Created by 杨志达 on 15/9/1.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import "BCGlobalEntity.h"

static BCGlobalEntity *_globalEntity = nil;

@implementation BCGlobalEntity

@synthesize token = _token;

@synthesize user_id = _user_id;

@synthesize gps_lat = _gps_lat;

@synthesize gps_lng = _gps_lng;

+ (BCGlobalEntity *)globalEntity
{
    if (_globalEntity == nil)
    {
        _globalEntity = [[BCGlobalEntity alloc] init];
    }
    
    return _globalEntity;
}

- (void)setToken:(NSString *)token
{
    _token = token;
 
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    [ud setObject:_token forKey:kBCUserDefaultsUserToken];
    
    [ud synchronize];
}

- (NSString *)token
{
    if (_token == nil)
    {
        _token = [[NSUserDefaults standardUserDefaults] objectForKey:kBCUserDefaultsUserToken];
    }
    
    return _token;
}

- (void)setUser_id:(NSString *)user_id
{
    _user_id = user_id;
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    [ud setObject:_user_id forKey:kBCUserDefaultsUserId];
    
    [ud synchronize];
}

- (NSString *)user_id
{
    if (_user_id == nil)
    {
        _user_id = [[NSUserDefaults standardUserDefaults] objectForKey:kBCUserDefaultsUserId];
    }
    
    return _user_id;
}


- (void)setGps_lat:(NSString *)gps_lat
{
    _gps_lat = gps_lat;
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    [ud setObject:_gps_lat forKey:kBCUserDefaultsUserGPSLat];
    
    [ud synchronize];
}

- (NSString *)gps_lat
{
    if (_gps_lat == nil)
    {
        _gps_lat = [[NSUserDefaults standardUserDefaults] objectForKey:kBCUserDefaultsUserGPSLat];
    }
    
    return _gps_lat;
}

- (void)setGps_lng:(NSString *)gps_lng
{
    _gps_lng = gps_lng;
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    [ud setObject:_gps_lng forKey:kBCUserDefaultsUserGPSLng];
    
    [ud synchronize];
}

- (NSString *)gps_lng
{
    if (_gps_lng == nil)
    {
        _gps_lng = [[NSUserDefaults standardUserDefaults] objectForKey:kBCUserDefaultsUserGPSLng];
    }
    
    return _gps_lng;
}

- (void)clearData
{
    _globalEntity = nil;
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];

    [ud setObject:nil forKey:kBCUserDefaultsUserToken];

    [ud setObject:nil forKey:kBCUserDefaultsUserId];

    [ud setObject:nil forKey:kBCUserDefaultsUserGPSLat];

    [ud setObject:nil forKey:kBCUserDefaultsUserGPSLng];

    [ud synchronize];
}


@end
