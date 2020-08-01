//
//  HHMomentsLayout.m
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/8/1.
//  Copyright © 2020 Cai. All rights reserved.
//

#import "HHMomentsLayout.h"
#import "HHMomentsModel.h"
#import "HHConst.h"

@implementation HHMomentsLayout

- (instancetype)initWithMoment:(HHMomentsModel *)moment {
    self = [super init];
    if (self) {
        _moment = moment;
        [self layout];
    }
    return self;
}

- (void)layout {
    // 计算高度
    _height = 0;
    
    //头像
    _height += HHMargin + HHAvatarHeight;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    //计算文本尺寸
    CGSize maxSize = CGSizeMake(screenWidth - HHMargin * 4 - HHAvatarHeight, MAXFLOAT);
    
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:maxSize text:[self matchesAttributedString:self.moment.content]];
    CGFloat introHeight = layout.textBoundingSize.height;
    
    //状态内容
    _height += introHeight + HHMargin;
    
    CGFloat leftMargin = HHMargin * 2 + HHAvatarHeight;
    
    CGFloat photosWidth = screenWidth - (HHMargin * 2 + HHAvatarHeight) - leftMargin;
    
    CGFloat imageHeight = (photosWidth - 2 * HHMargin)/3;

    //九宫图
    _height += imageHeight + HHMargin;
    
    //九宫图
    _height += 30 + HHMargin;
}

/// 设置行间距的NSAttributedString赋值给YYLabel
- (NSAttributedString *)matchesAttributedString:(NSString *)str{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];

    // 间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5.0]; // 行间距假如是5
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, attrStr.length)];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attrStr.length)];

    return attrStr;
}
@end
