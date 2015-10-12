//
//  BaseViewController.m
//  BCar
//
//  Created by WillDeng on 15/9/10.
//  Copyright (c) 2015年 eggeggs. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self commonInit];
}

#pragma mark - init
- (void)commonInit
{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - Private method
- (void)clearNavigationBar:(BOOL)isClear
{
    if (isClear)
    {
        UIImage *img = [[UIImage imageNamed:@"color_clear"] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
        
        [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
        
        [self.navigationController.navigationBar setShadowImage:img];
    }
    else
    {
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        
        [self.navigationController.navigationBar setShadowImage:nil];
    }
}

- (void)clearTabBar
{
    if ([self.navigationController.viewControllers.lastObject isKindOfClass:[self class]])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kBCNotificationMainTabBarHidden
                                                            object:self
                                                          userInfo:@{@"hidden": [NSNumber numberWithBool:NO]}];
    }
    else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:kBCNotificationMainTabBarHidden
                                                            object:self
                                                          userInfo:@{@"hidden": [NSNumber numberWithBool:YES]}];
    }
}


#pragma mark - Warning
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
