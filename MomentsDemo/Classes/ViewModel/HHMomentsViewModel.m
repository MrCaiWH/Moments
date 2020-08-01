//
//  HHMomentsViewModel.m
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/7/31.
//  Copyright © 2020 Cai. All rights reserved.
//

#import "HHMomentsViewModel.h"
#import <MJExtension/MJExtension.h>
#import "HHMomentsModel.h"
#import "HHMomentsLayout.h"

@interface HHMomentsViewModel ()
@property (nonatomic, strong, readwrite) NSMutableArray *dataArray;
@end

@implementation HHMomentsViewModel

- (void)loadData:(completeBlock)complete {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        NSDictionary *dic = [self getJsonData];
        NSArray *array = dic[@"data"];
        
        for (NSDictionary *dic in array) {
            HHMomentsModel *model = [HHMomentsModel mj_objectWithKeyValues:dic];
            HHMomentsLayout *layout = [[HHMomentsLayout alloc] initWithMoment:model];
            [self.dataArray addObject:layout];
        }
        
        //数据太少，多造点数据
        for (int i = 0; i < 15; ++i) {
            [self.dataArray addObjectsFromArray:self.dataArray];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (complete) {
                complete();
            }
        });
    });
}

- (NSDictionary *)getJsonData {
    
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"data" ofType:@"json"];
    
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];

    return dic;
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
@end
