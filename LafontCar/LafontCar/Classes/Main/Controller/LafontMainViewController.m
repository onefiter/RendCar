//
//  LafontMainViewController.m
//  LafontCar
//
//  Created by WillDeng on 15/9/24.
//  Copyright (c) 2015年 eggeggs. All rights reserved.
//

#import "LafontMainViewController.h"
#import "ZDLaunchMenu.h"
#import "LafontHomeViewController.h"
#import "LafontServiceViewController.h"
#import "LafontLoginViewController.h"
#import "BaseNavigationController.h"
#import "BCGlobalEntity.h"

typedef NS_ENUM(NSUInteger, LafontMainTabType) {
    /**
     
     *  首页
     */
    LafontMainTabTypeHome,
    /**
     *  服务
     */
    LafontMainTabTypeService,
    /**
     *  用户
     */
    LafontMainTabTypeUser,
    /**
     *  计数
     */
    LafontMainTabTypeCount

};

@interface LafontMainViewController ()<ZDLaunchMenuDelegate, UITabBarDelegate, LafontLoginViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIView *viewWork;
@property (strong, nonatomic) IBOutlet UIImageView *imgWork;
@property (strong, nonatomic) IBOutlet UIView *tabBarView;
@property (strong, nonatomic) IBOutlet UITabBar *tabBar;
@property (strong, nonatomic) ZDLaunchMenu *serviceMenu;

@end

@implementation LafontMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewControllersInit];
    [self notificationCenterInit];
}

- (void)viewControllersInit
{
    _tabBar.tintColor = [UIColor whiteColor];
    LafontHomeViewController *homeVc =[[LafontHomeViewController alloc] initWithNibName:@"LafontHomeViewController" bundle:[NSBundle mainBundle]];
    BaseNavigationController *homeNav = [[BaseNavigationController alloc] initWithRootViewController:homeVc];
    
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tabbar_home"] tag:LafontMainTabTypeHome];
    homeNav.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
    
    //服务
    LafontServiceViewController *serviceVC = [[LafontServiceViewController alloc] initWithNibName:@"LafontServiceViewController" bundle:[NSBundle mainBundle]];
    
    BaseNavigationController *serviceNC = [[BaseNavigationController alloc] initWithRootViewController:serviceVC];
    
    serviceNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:nil tag:LafontMainTabTypeService];
    
    //方向盘
    CGPoint center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 14);
    
    NSArray *images = @[[UIImage imageNamed:@"icon_0"],
                        [UIImage imageNamed:@"icon_1"],
                        [UIImage imageNamed:@"icon_2"]];
    
    _serviceMenu = [[ZDLaunchMenu alloc] initWithView:_tabBarView
                                               center:center
                                         radiusCenter:30
                                         radiusAround:25
                                        spaceDistance:35
                                            menuCount:images.count];
    
    _serviceMenu.imgCenter = [UIImage imageNamed:@"tabbar_wheel"];
    
    _serviceMenu.images = images;
    
    _serviceMenu.delegate = serviceVC;
    
//    个人
     LafontLoginViewController *userVC = [[LafontLoginViewController alloc] initWithNibName:@"LafontLoginViewController" bundle:[NSBundle mainBundle]];
    
    BaseNavigationController *userNC = [[BaseNavigationController alloc] initWithRootViewController:userVC];
    
    userNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tabbar_profile"] tag:LafontMainTabTypeUser];
    
    [userNC.tabBarItem setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];

    self.viewControllers = @[homeNav ,serviceNC,userNC];

    
}

- (void)notificationCenterInit
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarHidden:) name:kBCNotificationMainTabBarHidden object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userLogout:) name:kBCNotificationUserLogout object:nil];
}

#pragma mark - Selector & Delegate
- (void)tabBarHidden:(NSNotification *)info
{
    BOOL hidden = [[info.userInfo valueForKey:@"hidden"] boolValue];
    
    CGFloat y = 0;
    
    if (hidden)
    {
        y = [UIScreen height] + 16;
    }
    else
    {
        y = [UIScreen height] - _tabBar.frame.size.height;
    }
    
    CGRect rect = _tabBarView.frame;
    
    rect.origin.y = y;
    
    [UIView animateWithDuration:0.25 animations:^{
        _tabBarView.frame = rect;
    }];
}

- (void)userLogout:(NSNotification *)info
{
    [[BCGlobalEntity globalEntity] clearData];
    
    [self tabToIndex:0];
    
    [self presentLoginVC];
    
    for (UINavigationController *nc in _viewControllers)
    {
        [nc popToRootViewControllerAnimated:NO];
    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    [self tabToIndex:item.tag];
}

- (void)tabToIndex:(NSInteger)index
{
    //点击用户中心，未登录弹出登陆
    if ([BCGlobalEntity globalEntity].token == nil && index == LafontMainTabTypeUser)
    {
        [self presentLoginVC];
        
        [_tabBar setSelectedItem:_tabBar.items[_selectIndex]];
        
        return;
    }
    
    //非服务Tab,收起方向盘功能项
    if (index == LafontMainTabTypeService)
    {
        [_serviceMenu showOrDissmiss];
    }
    else
    {
        [_serviceMenu dissmiss];
    }
    
    _imgWork.image = [UIImage imageNamed:@"tab_img_bg_0"];
    
    //切换View
    for (UIViewController *vc in _viewControllers)
    {
        [vc.view removeFromSuperview];
    }
    
    [_viewWork addSubview:[_viewControllers[index] view]];
    
    _selectIndex = index;
}

- (void)presentLoginVC
{
    
    LafontLoginViewController *loginVC = nil;
    
    if ([UIScreen height] <= 480)
    {
        loginVC = [[LafontLoginViewController alloc] initWithNibName:@"LafontLoginViewController3_5"
                                                          bundle:[NSBundle mainBundle]];
    }
    else
    {
        loginVC = [[LafontLoginViewController alloc] initWithNibName:@"LafontLoginViewController"
                                                          bundle:[NSBundle mainBundle]];
    }
    
    loginVC.delegate = self;
    
    BaseNavigationController *loginNC = [[BaseNavigationController alloc] initWithRootViewController:loginVC];
    
    [self presentViewController:loginNC animated:YES completion:nil];
    
}

- (void)controller:(LafontLoginViewController *)vc loginComplete:(BOOL)succeed
{
    if (succeed)
    {
        [vc.navigationController dismissViewControllerAnimated:YES completion:nil];
        
        [_tabBar setSelectedItem:_tabBar.items.lastObject];
        
        [self tabToIndex:_tabBar.items.count - 1];
    }
}

//
#pragma mark - Setter & Getter
- (void)setViewControllers:(NSArray *)viewControllers
{
    _viewControllers = viewControllers;
    
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:viewControllers.count];
    
    for (UIViewController *vc in viewControllers)
    {
        [items addObject:vc.tabBarItem];
    }
    
    _tabBar.items = [items copy];
    
    _tabBar.delegate = self;
    
    [self.view bringSubviewToFront:_tabBarView];
    
    [_tabBar setSelectedItem:_tabBar.items.firstObject];
    
    [self tabToIndex:0];
     
}



- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    for (UIViewController *vc in _viewControllers)
    {
        vc.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
