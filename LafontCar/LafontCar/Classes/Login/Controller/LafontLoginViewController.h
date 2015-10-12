//
//  LafontLoginViewController.h
//  LafontCar
//
//  Created by WillDeng on 15/9/25.
//  Copyright (c) 2015年 eggeggs. All rights reserved.
//

#import "BaseViewController.h"

@class LafontLoginViewController;

@protocol LafontLoginViewControllerDelegate <NSObject>

- (void)controller:(LafontLoginViewController *)vc loginComplete:(BOOL)succeed;

@end

@interface LafontLoginViewController : BaseViewController

@property (nonatomic, weak) id<LafontLoginViewControllerDelegate>delegate;

@end
