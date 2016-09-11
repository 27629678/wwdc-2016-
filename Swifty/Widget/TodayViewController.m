//
//  TodayViewController.m
//  Widget
//
//  Created by hzyuxiaohua on 16/9/11.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    NSLog(@"widget will perform update...");
    completionHandler(NCUpdateResultNewData);
}

- (IBAction)alertBtnAction:(id)sender
{
    NSLog(@"Alert");
    [self openContainerAppWithEventName:@"Alert"];
}

- (IBAction)actionSheetBtnAction:(id)sender
{
    NSLog(@"ActionSheet");
    [self openContainerAppWithEventName:@"ActionSheet"];
}


- (IBAction)notificationBtnAction:(id)sender
{
    NSLog(@"Notification");
    [self openContainerAppWithEventName:@"Notification"];
}

#pragma mark - private

- (void)openContainerAppWithEventName:(NSString *)event
{
    NSString* urlString = [NSString stringWithFormat:@"swifty://www.xy.com/?event=%@", event];
    [self.extensionContext openURL:[NSURL URLWithString:urlString] completionHandler:NULL];
}

@end
