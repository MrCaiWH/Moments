//
//  HHWebViewViewController.m
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/8/2.
//  Copyright © 2020 Cai. All rights reserved.
//

#import "HHWebViewViewController.h"
#import <WebKit/WebKit.h>

@interface HHWebViewViewController ()

@end

@implementation HHWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"H5";
    
    WKWebView *view = [[WKWebView alloc] initWithFrame:self.view.frame];
    [view loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
    [self.view addSubview:view];
}

@end
