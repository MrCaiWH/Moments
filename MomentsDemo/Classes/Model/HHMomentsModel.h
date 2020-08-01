//
//  HHMomentsModel.h
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/7/31.
//  Copyright © 2020 Cai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHMomentsModel : NSObject

/** 头像 */
@property (nonatomic, copy) NSString *icon;
/** 姓名 */
@property (nonatomic, copy) NSString *name;
/** 内容 */
@property (nonatomic, copy) NSString *content;
/** 图片 */
@property (nonatomic, strong) NSArray *photos;

@end

NS_ASSUME_NONNULL_END
