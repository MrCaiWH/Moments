//
//  HHMomentsTableView.m
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/7/31.
//  Copyright © 2020 Cai. All rights reserved.
//

#import "HHMomentsTableView.h"
#import "HHMomentsViewModel.h"
#import "HHMomentsTableViewCell.h"
#import "HHMomentsModel.h"
#import "HHMomentsLayout.h"

@interface HHMomentsTableView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) HHMomentsViewModel *viewModel;
@end

@implementation HHMomentsTableView

#pragma mark - Intial Methods
- (instancetype)initWithViewModel:(HHMomentsViewModel *)viewModel {
    if (self = [super init]) {

        _viewModel = viewModel;
        
        self.dataSource = self;
        self.delegate = self;
        
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
         
         self.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:251/255.0 alpha:1.0];
         [self registerClass:[HHMomentsTableViewCell class] forCellReuseIdentifier:[HHMomentsTableViewCell identifier]];

         self.separatorStyle = UITableViewCellSeparatorStyleNone;
         self.tableFooterView = [UIView new];
        
        [self bindViewModel];
    }
    return self;
}

- (void)bindViewModel {
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HHMomentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HHMomentsTableViewCell identifier] forIndexPath:indexPath];
    HHMomentsLayout *layout = self.viewModel.dataArray[indexPath.row];
    cell.model = layout.moment;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HHMomentsLayout *layout = self.viewModel.dataArray[indexPath.row];
    return layout.height;
}

@end
