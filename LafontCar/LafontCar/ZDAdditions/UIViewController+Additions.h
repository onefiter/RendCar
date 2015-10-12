//
//  UIViewController+Additions.h
//  BCar
//
//  Created by 杨志达 on 15/9/19.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIViewController (Additions)

- (MBProgressHUD *)showHUDLoading;

- (void)showHUDText:(NSString *)text;

- (void)hideHUD:(MBProgressHUD *)HUD;

@end
