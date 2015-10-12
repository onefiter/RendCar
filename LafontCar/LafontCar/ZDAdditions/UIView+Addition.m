//
//  UIView+Addition.m
//  ZDBaseCode
//
//  Created by 杨志达 on 15/8/21.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)

- (UIImage *)shotSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, self.opaque, 1);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

@end
