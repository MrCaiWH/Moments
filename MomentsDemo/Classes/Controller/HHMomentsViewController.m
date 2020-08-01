//
//  HHMomentsViewController.m
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/7/31.
//  Copyright © 2020 Cai. All rights reserved.
//

#import "HHMomentsViewController.h"
#import "HHMomentsTableView.h"
#import "HHMomentsViewModel.h"
#import <Masonry/Masonry.h>

@interface HHMomentsViewController ()
@property (nonatomic, strong) HHMomentsTableView *momentsTableView;
@property (nonatomic, strong) HHMomentsViewModel *momentsViewModel;
@end

@implementation HHMomentsViewController

#pragma mark - Viewlife
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.title = @"朋友圈";
    
    [self.view addSubview:self.momentsTableView];
    
    [self.momentsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

#pragma mark - Lazy
- (HHMomentsTableView *)momentsTableView {
    if (_momentsTableView == nil) {
        _momentsTableView = [[HHMomentsTableView alloc] initWithViewModel:self.momentsViewModel];
    }
    return _momentsTableView;
}

- (HHMomentsViewModel *)momentsViewModel {
    if (_momentsViewModel == nil) {
        _momentsViewModel = [[HHMomentsViewModel alloc] init];
    }
    return _momentsViewModel;
}
@end
