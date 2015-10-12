//
//  UIViewController+Additions.m
//  BCar
//
//  Created by 杨志达 on 15/9/19.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import "UIViewController+Additions.h"

@implementation UIViewController (Additions)

- (MBProgressHUD *)showHUDLoading
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    
    HUD.tintColor = [UIColor whiteColor];
    
    [self.view addSubview:HUD];
    
    HUD.mode = MBProgressHUDModeIndeterminate;
    
    [HUD show:YES];
    
    return HUD;
}

- (void)showHUDText:(NSString *)text
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    
    [self.view addSubview:HUD];
    
    HUD.mode = MBProgressHUDModeText;
    
    HUD.labelText = text;

    HUD.margin = 10.f;

    HUD.labelFont = [UIFont defaultWithSize:15];

    [HUD show:YES];
    
    HUD.removeFromSuperViewOnHide = YES;

    [HUD hide:YES afterDelay:1.5];
}

- (void)hideHUD:(MBProgressHUD *)HUD
{
    if (HUD)
    {
        HUD.removeFromSuperViewOnHide = YES;
        
        [HUD hide:YES];
    }
}

@end
