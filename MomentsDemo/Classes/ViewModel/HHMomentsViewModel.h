//
//  HHMomentsViewModel.h
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/7/31.
//  Copyright © 2020 Cai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

typedef void (^completeBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface HHMomentsViewModel : NSObject

- (void)loadData:(completeBlock)complete;

@property (nonatomic, strong, readonly) NSMutableArray *dataArray;

@property (nonatomic, strong, readonly) RACSubject *textLinkSubject;

@end

NS_ASSUME_NONNULL_END
