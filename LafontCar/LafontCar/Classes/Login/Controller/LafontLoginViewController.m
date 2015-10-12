//
//  LafontLoginViewController.m
//  LafontCar
//
//  Created by WillDeng on 15/9/25.
//  Copyright (c) 2015年 eggeggs. All rights reserved.
//

#import "LafontLoginViewController.h"

@interface LafontLoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImg;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *psw;
@property (weak, nonatomic) IBOutlet UIButton *btnRegister;
@property (weak, nonatomic) IBOutlet UIButton *btnForgetPsw;
@property (weak, nonatomic) IBOutlet UIButton *btnCancle;

@end

@implementation LafontLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)btnCancle:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
