//
//  HHMomentsTableView.h
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/7/31.
//  Copyright © 2020 Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HHMomentsViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface HHMomentsTableView : UITableView

- (instancetype)initWithViewModel:(HHMomentsViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
