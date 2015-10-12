//
//  NSString+Addition.m
//  ZDBaseCode
//
//  Created by 杨志达 on 15/8/21.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import "NSString+Addition.h"

#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Addition)

+ (NSString *)getCurrency:(double)number symbol:(NSString *)symbol
{
    NSNumberFormatter * fmt;
    
    NSNumber          * n;
 
    symbol = [NSString nilToSpace:symbol];
    
    fmt = [[NSNumberFormatter alloc ] init];
    
    n   = [NSNumber numberWithDouble: number];
    
    [fmt setFormatterBehavior: NSNumberFormatterBehavior10_4];
    
    [fmt setCurrencySymbol: symbol];
    
    [fmt setNumberStyle: NSNumberFormatterCurrencyStyle];
    
    NSString* formatedString = [fmt stringFromNumber:n] ;
    
    return formatedString;
}

+ (NSString *)md5Hash:(NSString *)source
{
    const char* str = [source UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (unsigned int)strlen(str), result);
    
    NSMutableString *dest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [dest appendFormat:@"%02x",result[i]];
    }
    
    return [dest uppercaseString];
}

+ (NSString *)nilToSpace:(NSString *)string
{
    if (string == nil)
    {
        return @"";
    }
    else
    {
        return string;
    }
}

@end
