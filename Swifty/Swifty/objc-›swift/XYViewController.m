//
//  XYViewController.m
//  Swifty
//
//  Created by hzyuxiaohua on 7/13/16.
//  Copyright © 2016 XY. All rights reserved.
//

#import "XYViewController.h"
#import "Swifty-Swift.h"

@implementation XYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self logViewState:NSStringFromSelector(_cmd)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    MainViewController* vc = [[MainViewController alloc] init];
    NSLog(@"%@", [vc localeDescription]);
}

@end
