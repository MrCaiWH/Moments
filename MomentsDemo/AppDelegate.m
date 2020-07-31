//
//  AppDelegate.m
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/7/31.
//  Copyright © 2020 Cai. All rights reserved.
//

#import "AppDelegate.h"
#import "HHMomentsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    HHMomentsViewController *mainVC = [[HHMomentsViewController alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = mainVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
