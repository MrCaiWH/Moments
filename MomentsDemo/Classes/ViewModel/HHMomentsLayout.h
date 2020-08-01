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

@property (nonatomic, assign, readonly) CGRect iconViewF;
@property (nonatomic, assign, readonly) CGRect nameLableF;
@property (nonatomic, assign, readonly) CGRect messageLabelF;
@property (nonatomic, assign, readonly) CGRect photoContainerViewF;
@property (nonatomic, assign, readonly) CGRect timeLabelF;
@property (nonatomic, assign, readonly) CGRect dividerF;

// 总高度
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, strong) NSAttributedString *messageAttStr;

@end

NS_ASSUME_NONNULL_END
