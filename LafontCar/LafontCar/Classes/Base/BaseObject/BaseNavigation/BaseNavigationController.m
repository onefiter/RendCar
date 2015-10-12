//
//  BaseNavigationController.m
//  DisplayColor
//
//  Created by WillDeng on 15/7/23.
//  Copyright (c) 2015年 eggeggs. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self subviewInit];
}


#pragma mark - init
- (void)subviewInit
{
    self.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    self.navigationBar.tintColor = [UIColor whiteColor];
}

@end
