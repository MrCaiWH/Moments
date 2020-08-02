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
#import <YBImageBrowser/YBImageBrowser.h>
#import "HHWebViewViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>

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
    
    __weak typeof(self) weakSelf = self;
    [self.momentsViewModel loadData:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.momentsTableView reloadData];
    }];
    
    [self subscribe];
}

- (void)subscribe {
    @weakify(self)
    [self.momentsViewModel.textLinkSubject subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        if ([x isKindOfClass:[NSString class]]) {
            HHWebViewViewController *h5VC = [[HHWebViewViewController alloc] init];
            h5VC.urlStr = x;
            [self.navigationController pushViewController:h5VC animated:YES];
        }
        else {
            [SVProgressHUD showErrorWithStatus:@"参数非法"];
        }
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
