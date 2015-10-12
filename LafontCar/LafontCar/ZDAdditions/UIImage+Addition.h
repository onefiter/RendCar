//
//  UIImage+Addition.h
//  ZDBaseCode
//
//  Created by 杨志达 on 15/8/21.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addition)

/**
 *  生成纯色图片
 *
 *  @param color 颜色对象
 *  @param size  尺寸
 *
 *  @return 新图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  制作毛玻璃效果图像
 *
 *  @param blurRadius            模糊度
 *  @param tintColor             颜色
 *  @param saturationDeltaFactor 饱和度
 *  @param maskImage             阴影图
 *
 *  @return 处理后图片
 */
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;

@end
