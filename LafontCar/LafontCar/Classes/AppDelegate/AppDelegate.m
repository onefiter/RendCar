//
//  AppDelegate.m
//  LafontCar
//
//  Created by WillDeng on 15/9/24.
//  Copyright (c) 2015年 eggeggs. All rights reserved.
//

#import "AppDelegate.h"
#import "LafontMainViewController.h"
#import <QMapKit/QMapKit.h>
#import "BCConfigurations.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
- (void)backBarButtonInit
{
    //统一返回按钮
    UIImage *backButtonImage = [[UIImage imageNamed:@"back_long_default"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                                forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(2, -1) forBarMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
}

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    LafontMainViewController *mainVC = [[LafontMainViewController alloc] initWithNibName:@"LafontMainViewController" bundle:[NSBundle mainBundle]];
    
    self.window.rootViewController = mainVC;
    
    //地图
    [QMapServices sharedServices].apiKey = QMAP_SERVICES_API_KEY;
    
    [self backBarButtonInit];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
