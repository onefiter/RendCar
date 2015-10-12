//
//  ZDLaunchMenu.m
//
//  Created by 杨志达 on 15/8/4.
//  Copyright (c) 2015年 Kitten Yang. All rights reserved.
//

#import "ZDLaunchMenu.h"

#define animation_show 1.2f
#define animation_dismiss 0.3f
#define animation_delay 0.08f

@interface ZDLaunchMenu ()

@property (nonatomic, strong) UIView *showView;

@property (nonatomic, assign) BOOL isOpened;

@property (nonatomic, strong) UIButton *centerBtn;

@property (nonatomic, strong) NSMutableArray *menuPoints;

@property (nonatomic, strong) NSMutableArray *menus;

@end

@implementation ZDLaunchMenu

#pragma mark - Initialize
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
                   menuCount:(NSUInteger)menuCount
{
    self = [super init];
    if (self)
    {

    [self setShowView:showView center:pointCenter radiusCenter:radiusCenter radiusAround:radiusAround spaceDistance:spaceDistance menuCount:menuCount];
        
        [self centerBtnInit];
        
        [self menuBtnInit];
    }
    
    return self;
}

- (void)centerBtnInit
{
    UIView *centerView = [[UIView alloc] init];
    
    centerView.userInteractionEnabled = NO;
    
    centerView.backgroundColor = [UIColor clearColor];
    
    centerView.bounds = CGRectMake(0, 0, _radiusCenter * 2, _radiusCenter * 2);
    
    centerView.layer.masksToBounds = YES;
    
    centerView.layer.cornerRadius = _radiusCenter;
    
    centerView.clipsToBounds = YES;
    
    centerView.center = _pointCenter;
    
    if ([UIDevice iOS8Later])
    {
        UINavigationBar *centerBar = [[UINavigationBar alloc] init];
        
        centerBar.frame = CGRectMake(0, 0, _radiusCenter * 2, _radiusCenter * 2);
        
        centerBar.barStyle = UIBarStyleBlackTranslucent;
        
        [centerView addSubview:centerBar];
    }
    
    [_showView addSubview:centerView];
    
    _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _centerBtn.userInteractionEnabled = NO;
    
    _centerBtn.frame = CGRectMake(0, 0, _radiusCenter * 2, _radiusCenter * 2);
    
    _centerBtn.exclusiveTouch = YES;

    [_centerBtn addTarget:self action:@selector(centerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [centerView addSubview:_centerBtn];
}

/**
 *  创建Menu Button
 */
-(void)menuBtnInit
{
    for (int i = 0; i < _menuCount; i++)
    {
        UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        itemBtn.tag = i;
        
        itemBtn.alpha = 0;
        
        itemBtn.clipsToBounds = YES;
        
        itemBtn.exclusiveTouch = YES;
        
        itemBtn.bounds = CGRectMake(0, 0, _radiusAround * 2, _radiusAround * 2);
        
        itemBtn.center = _pointCenter;
        
        [itemBtn addTarget:self action:@selector(itemBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_showView insertSubview:itemBtn belowSubview:_centerBtn];

        [_menus addObject:itemBtn];
    }
}

/**
 *  预设弹出位置
 */
- (void)locationInit
{
    [_menuPoints removeAllObjects];
    
    //子视图离开主视图的距离
    CGFloat distance = _radiusCenter + _radiusAround + _spaceDistance;
    
    //平分之后的角度,弧度制，因为sinf、cosf需要弧度制
    CGFloat degree = (180/(_menuCount + 1))*(M_PI/180);
    
    for (int i = 0; i < _menuCount; i ++)
    {
        //计算弹出位置并保存
        CGFloat cosDegree = cosf(degree * (i + 1));
        
        CGFloat sinDegree = sinf(degree * (i + 1));
        
        CGPoint center = CGPointMake(_pointCenter.x + distance * cosDegree, _pointCenter.y - distance * sinDegree);
        
        [_menuPoints addObject:[NSValue valueWithCGPoint:center]];
    }
}

#pragma mark - Private Methods

- (void)setShowView:(UIView *)showView
             center:(CGPoint)pointCenter
       radiusCenter:(CGFloat)radiusCenter
       radiusAround:(CGFloat)radiusAround
      spaceDistance:(CGFloat)spaceDistance
          menuCount:(NSUInteger)menuCount
{
    _showView = showView;
    
    _pointCenter = pointCenter;
    
    _radiusCenter = radiusCenter;
    
    _radiusAround = radiusAround;
    
    _spaceDistance = spaceDistance;
    
    _menuCount = menuCount;
    
  
    _menuPoints = [[NSMutableArray alloc] initWithCapacity:menuCount];
    
    _menus = [[NSMutableArray alloc] initWithCapacity:menuCount];
}

#pragma mark - Selector
- (void)showOrDissmiss
{
    [self centerBtnAction:nil];
}

- (void)show
{
    if (_isOpened == NO)
    {
        [self centerBtnAction:nil];
    }
}

- (void)dissmiss
{
    if (_isOpened == YES)
    {
        [self centerBtnAction:nil];
    }
}

- (void)centerBtnAction:(UIButton *)sender
{
    if (_isOpened == NO)
    {
        if ([_delegate respondsToSelector:@selector(ZDLaunchMenuWillAppear:)])
        {
            [_delegate ZDLaunchMenuWillAppear:self];
        }
        
        [self locationInit];
        
        [self rotateCenterBtnClockwise:YES];
        
        [self itemOpen:YES];
        
        if ([_delegate respondsToSelector:@selector(ZDLaunchMenuDidAppear:)])
        {
            [_delegate ZDLaunchMenuDidAppear:self];
        }
        
        _isOpened = YES;
    }
    else
    {
        if ([_delegate respondsToSelector:@selector(ZDLaunchMenuWillDisappear:)])
        {
            [_delegate ZDLaunchMenuWillDisappear:self];
        }
        
        [self rotateCenterBtnClockwise:NO];

        [self itemOpen:NO];

        _isOpened = NO;
        
        if ([_delegate respondsToSelector:@selector(ZDLaunchMenuDidDisappear:)])
        {
            [_delegate ZDLaunchMenuDidDisappear:self];
        }
    }
}

/**
 *  功能按钮弹出收起
 *
 *  @param open YES弹出 NO收起
 */
- (void)itemOpen:(BOOL)open
{
    if (open)
    {
        for (int i = 0; i < _menus.count; i ++)
        {
            UIButton *itemBtn = _menus[i];
            
            if ([UIDevice iOS7Later])
            {
                [UIView animateWithDuration:animation_show
                                      delay:animation_delay * i
                     usingSpringWithDamping:0.5f
                      initialSpringVelocity:0.0
                                    options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction
                                 animations:^{
                                     
                                     CGPoint itemPoint = [_menuPoints[i] CGPointValue];
                                     
                                     itemBtn.center = itemPoint;
                                     
                                     itemBtn.alpha = 1;
                                     
                                 }completion:^(BOOL finished) {
                                     //Nothing
                                 }];
            }
            else
            {
                [UIView animateWithDuration:animation_dismiss
                                      delay:animation_delay * i
                                    options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction
                                 animations:^{
                                     
                                     CGPoint itemPoint = [_menuPoints[i] CGPointValue];
                                     
                                     itemBtn.center = itemPoint;
                                     
                                     _centerBtn.transform = CGAffineTransformMakeRotation(M_PI);
                                     
                                     itemBtn.alpha = 1;
                                     
                                 } completion:^(BOOL finished) {
                                     //Nothing
                                 }];
            }
        }
    }
    else
    {
        for (int i = 0; i < _menus.count; i ++)
        {
            UIButton *itemBtn = _menus[i];
            
            [UIView animateWithDuration:animation_dismiss
                                  delay:animation_delay * i
                                options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction
                             animations:^{
                                 
                                 itemBtn.center = _pointCenter;
                                 
                                 _centerBtn.transform = CGAffineTransformIdentity;
                                 
                                 itemBtn.alpha = 0;
                                 
                             } completion:^(BOOL finished) {
                                 //Nothing
                             }];
        }
        
    }
}

/**
 *  方向盘转动
 *
 *  @param colockwise 转动方向 YES顺时针
 */
- (void)rotateCenterBtnClockwise:(BOOL)colockwise
{
    CGFloat direction = 1;
    
    if (colockwise == NO)
    {
        direction = -1;
    }

    if ([UIDevice iOS8Later])
    {
        for (int i = 1 ; i <= 4; i ++)
        {
            [UIView animateWithDuration:animation_show
                                  delay:animation_delay * i
                 usingSpringWithDamping:0.5f
                  initialSpringVelocity:0.0
                                options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction
                             animations:^{
                                 _centerBtn.transform = CGAffineTransformMakeRotation(direction * M_PI_2 * i);
                             }completion:^(BOOL finished) {
                                 //Nothing
                             }];
        }
    }
    else if ([UIDevice iOS7Later])
    {
        CABasicAnimation *animationZ = nil;
        
        animationZ = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        
        animationZ.toValue = [NSNumber numberWithFloat: direction * M_PI_2 * 3 ];
        
        animationZ.duration = 0.3;
        
        animationZ.fillMode = kCAFillModeForwards;
        
        animationZ.removedOnCompletion = NO;
        
        animationZ.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        
        [animationZ setValue:@"rotationAnimation" forKey:@"transformRotationZ"];
        
        [_centerBtn.layer addAnimation:animationZ forKey:@"transformRotationZ"];
        
        [UIView animateWithDuration:animation_show - 0.2
                              delay:0.2
             usingSpringWithDamping:0.5f
              initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             _centerBtn.superview.transform = CGAffineTransformMakeRotation(direction * M_PI_2);
                         }completion:^(BOOL finished) {
                             //Nothing
                         }];
    }
    else
    {
        CABasicAnimation *animationZ = nil;
        
        animationZ = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        
        animationZ.toValue = [NSNumber numberWithFloat: direction * M_PI_2 * 4];
        
        animationZ.duration = 0.3;
        
        animationZ.fillMode = kCAFillModeForwards;
        
        animationZ.removedOnCompletion = NO;
        
        animationZ.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        
        [animationZ setValue:@"rotationAnimation" forKey:@"transformRotationZ"];
        
        [_centerBtn.layer addAnimation:animationZ forKey:@"transformRotationZ"];
    }
}

- (void)itemBtnAction:(UIButton *)sender
{
    [self centerBtnAction:nil];
    
    if ([_delegate respondsToSelector:@selector(ZDLaunchMenu:didSelected:)])
    {
        [_delegate ZDLaunchMenu:self didSelected:sender.tag];
    }
}

#pragma mark - Setter & Getter
- (void)setImgCenter:(UIImage *)imgCenter
{
    _imgCenter = imgCenter;
    
    [_centerBtn setBackgroundImage:imgCenter forState:UIControlStateNormal];
}

- (void)setImgPrsCenter:(UIImage *)imgPrsCenter
{
    _prsImgCenter = imgPrsCenter;
    
    [_centerBtn setBackgroundImage:imgPrsCenter forState:UIControlStateHighlighted];
}

- (void)setImages:(NSArray *)images
{
    _images = images;
    
    for (int i = 0; i < _menuCount; i ++)
    {
        if (images.count > i)
        {
            UIButton *itemBtn = _menus[i];
            
            [itemBtn setBackgroundImage:images[i] forState:UIControlStateNormal];
        }
    }
}

- (void)setPrsImages:(NSArray *)prsImages
{
    _prsImages = prsImages;
    
    for (int i = 0; i < _menuCount; i ++)
    {
        
        if (prsImages.count > i)
        {
            UIButton *itemBtn = _menus[i];
            
            [itemBtn setBackgroundImage:_prsImages[i] forState:UIControlStateHighlighted];
        }
    }
}


@end
