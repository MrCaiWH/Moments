//
//  HHMomentsTableViewCell.m
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/7/31.
//  Copyright © 2020 Cai. All rights reserved.
//

#import "HHMomentsTableViewCell.h"
#import "HHMomentsModel.h"
#import "HHPhotoView.h"

@interface HHMomentsTableViewCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) HHPhotoView *photoView;
@end

@implementation HHMomentsTableViewCell

- (void)setModel:(HHMomentsModel *)model {
    _model = model;
    
}

#pragma mark - Lazy
+ (NSString *)identifier {
    return [NSString stringWithUTF8String:object_getClassName([self class])];
}

@end
