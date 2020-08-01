//
//  HHMomentsTableViewCell.h
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/7/31.
//  Copyright © 2020 Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HHMomentsModel;

NS_ASSUME_NONNULL_BEGIN

@interface HHMomentsTableViewCell : UITableViewCell

@property (nonatomic, strong) HHMomentsModel *model;

+ (NSString *)identifier;
@end

NS_ASSUME_NONNULL_END
