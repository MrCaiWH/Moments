//
//  HHMomentsLayout.h
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/8/1.
//  Copyright © 2020 Cai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYText/YYText.h>

@class HHMomentsModel;

NS_ASSUME_NONNULL_BEGIN

@interface HHMomentsLayout : NSObject

- (instancetype)initWithMoment:(HHMomentsModel *)moment;

@property (nonatomic, strong) HHMomentsModel *moment;

// 总高度
@property (nonatomic, assign) CGFloat height;

@end

NS_ASSUME_NONNULL_END
