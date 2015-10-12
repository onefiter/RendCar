//
//  ZDLaunchMenu.h
//
//  Created by 杨志达 on 15/8/4.
//  Copyright (c) 2015年 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZDLaunchMenu;

@protocol ZDLaunchMenuDelegate<NSObject>
@optional
/**
 *  菜单点击代理
 *
 *  @param menu  菜单本身
 *  @param index 点击的按钮序号
 */
-(void)ZDLaunchMenu:(ZDLaunchMenu *)menu didSelected:(NSInteger)index;

-(void)ZDLaunchMenuWillAppear:(ZDLaunchMenu *)menu;

-(void)ZDLaunchMenuDidAppear:(ZDLaunchMenu *)menu;

-(void)ZDLaunchMenuWillDisappear:(ZDLaunchMenu *)menu;

-(void)ZDLaunchMenuDidDisappear:(ZDLaunchMenu *)menu;

@end

@interface ZDLaunchMenu : UIView

/**
 *  初始化方法，参数都必传
 *
 *  @param view          添加到哪个View上
 *  @param center        中心坐标
 *  @param radiusCenter  中心按钮半径
 *  @param radiusAround  周围按钮半径
 *  @param spaceDistance 空隙
 *  @param count         周围按钮个数
 *
 *  @return 返回对象
 */
- (instancetype)initWithView:(UIView *)showView
                      center:(CGPoint)pointCenter
                radiusCenter:(CGFloat)radiusCenter
                radiusAround:(CGFloat)radiusAround
               spaceDistance:(CGFloat)spaceDistance
                   menuCount:(NSUInteger)menuCount;

- (void)showOrDissmiss;

- (void)show;

- (void)dissmiss;

@property (nonatomic, readonly) BOOL isOpened;

/**
 *  代理
 */
@property (nonatomic, weak)     id <ZDLaunchMenuDelegate>delegate;

/**
 *  周围按钮个数
 */
@property (nonatomic, readonly, assign) NSUInteger menuCount;

/**
 *  中心按钮与周围按钮之间的空隙长度
 */
@property (nonatomic, assign)   CGFloat spaceDistance;

/**
 *  中心按钮背景图
 */
@property (nonatomic, strong)   UIImage *imgCenter;

/**
 *  中心按钮背景图 被按下
 */
@property (nonatomic, strong)   UIImage *prsImgCenter;

/**
 *  中心按钮中心坐标
 */
@property (nonatomic, assign)   CGPoint pointCenter;

/**
 *  中心按钮半径
 */
@property (nonatomic, assign)   CGFloat radiusCenter;

/**
 *  周围按钮半径
 */
@property (nonatomic, assign)   CGFloat radiusAround;

/**
 *  周围按钮图片
 */
@property (nonatomic, copy)     NSArray *images;

/**
 *  周围按钮图片 被按下
 */
@property (nonatomic, copy)     NSArray *prsImages;

/**
 *  周围按钮文字
 */
@property (nonatomic, copy)     NSArray *titles;

@end
