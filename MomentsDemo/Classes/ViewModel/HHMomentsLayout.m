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

@interface HHMomentsLayout ()
@property (nonatomic, assign, readwrite) CGRect iconViewF;
@property (nonatomic, assign, readwrite) CGRect nameLableF;
@property (nonatomic, assign, readwrite) CGRect messageLabelF;
@property (nonatomic, assign, readwrite) CGRect photoContainerViewF;
@property (nonatomic, assign, readwrite) CGRect timeLabelF;
@property (nonatomic, assign, readwrite) CGRect dividerF;

@property (nonatomic, assign, readwrite) CGFloat height;
@property (nonatomic, strong, readwrite) NSAttributedString *messageAttStr;
@end

@implementation HHMomentsLayout

//三种情况

//有照片，由内容

//只有内容

//只有照片

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
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    //头像
    self.iconViewF = CGRectMake(HHMargin, HHMargin, HHAvatarHeight, HHAvatarHeight);
    
    _height += HHMargin + HHAvatarHeight;
    
    //姓名
    CGFloat nameLableX = CGRectGetMaxX(self.iconViewF) + HHMargin;
    CGFloat nameLableW = screenWidth - nameLableX - HHMargin;
    
    self.nameLableF = CGRectMake(nameLableX, HHMargin, nameLableW, 20);

    
    //计算文本尺寸
    
    if (self.moment.content) { //没有内容
        
        CGFloat messageLableW = screenWidth - nameLableX - HHMargin * 2;

        CGSize maxSize = CGSizeMake(messageLableW, MAXFLOAT);
        
        NSAttributedString *messageAtr = [self matchesAttributedString:self.moment.content textLink:self.moment.textlink];
        
        self.messageAttStr = messageAtr;

        YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:maxSize text:messageAtr];
        CGFloat introHeight = layout.textBoundingSize.height + HHMargin;

        //状态内容
        _height += introHeight + HHMargin;

        CGFloat messageLableX = nameLableX;
        CGFloat messageLableY = CGRectGetMaxY(self.nameLableF) + HHMargin;;

        self.messageLabelF = CGRectMake(messageLableX, messageLableY, messageLableW, introHeight);
    }
    
    //九宫图
    
    if (self.moment.photos) { //没有照片
        
        CGFloat leftMargin = HHMargin * 2 + HHAvatarHeight;

        CGFloat photosW = screenWidth - leftMargin * 2;
        
        CGFloat imageW = (photosW - HHMargin * 2)/3;
        
        CGFloat photosH = 0;
        
        if (self.moment.photos.count > 6) {
            photosH = photosW;
        }
        else if (self.moment.photos.count > 3) {
            photosH = imageW * 2 + HHMargin;
        }
        else {
             photosH = imageW;
        }

        CGFloat photoContainerX = leftMargin;
        
        CGFloat photoContainerY = 0;
        
        if (self.moment.content) { //没有内容
            photoContainerY = CGRectGetMaxY(self.messageLabelF) + HHMargin;
        }
        else {
            photoContainerY = CGRectGetMaxY(self.nameLableF) + HHMargin;
        }
        
        //只有一张图片
        if (self.moment.photos.count == 1) {
            self.photoContainerViewF = CGRectMake(photoContainerX, photoContainerY, photosW * 2, photosH * 2);
            _height += photosH * 2 + HHMargin;
        }
        else {
            self.photoContainerViewF = CGRectMake(photoContainerX, photoContainerY, photosW, photosH);
            _height += photosH + HHMargin;
        }
    }
    
    //时间
    _height += 30 + HHMargin;
    
    CGFloat timeLabelY = 0;
    
    if (!self.moment.photos) { //没有照片
        timeLabelY = CGRectGetMaxY(self.messageLabelF) + HHMargin;
    }
    else {
        timeLabelY = CGRectGetMaxY(self.photoContainerViewF) + HHMargin;
    }
    
     CGFloat timeLabelX = HHMargin * 2 + HHAvatarHeight;
    
    self.timeLabelF = CGRectMake(timeLabelX, timeLabelY, nameLableW, 30);
    
    CGFloat dividerY = CGRectGetMaxY(self.timeLabelF) + HHMargin;
    
    self.dividerF = CGRectMake(0, dividerY, screenWidth, 0.5);
    
    //时间
    _height += HHMargin;
}

/// 设置行间距的NSAttributedString赋值给YYLabel
- (NSAttributedString *)matchesAttributedString:(NSString *)content textLink:(NSString *)textLink {

    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:content];
    
    // 间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5.0]; // 行间距假如是5
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [content length])];
    
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, attrStr.length)];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attrStr.length)];
    
    if (textLink) {
        NSRange range = [content rangeOfString:textLink];
        __weak typeof(self) weakSelf = self;
        [attrStr yy_setTextHighlightRange:range color:[UIColor blueColor] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (strongSelf.textLinkBlock) {
                strongSelf.textLinkBlock();
            }
        }];
    }

    return attrStr;
}
@end
