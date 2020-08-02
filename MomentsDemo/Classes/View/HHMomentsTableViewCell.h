//
//  HHMomentsTableViewCell.h
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/7/31.
//  Copyright © 2020 Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HHMomentsLayout;

NS_ASSUME_NONNULL_BEGIN

@interface HHMomentsTableViewCell : UITableViewCell

@property (nonatomic, strong) HHMomentsLayout *layout;

@property (nonatomic, copy) void(^textLinkBlock)(void);


+ (NSString *)identifier;
@end

NS_ASSUME_NONNULL_END
