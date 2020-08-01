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

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self test];
    }
    return self;
}

- (void)test {
    
    NSDictionary *dic = [self getJsonData];
    NSArray *array = dic[@"data"];
    
    for (NSDictionary *dic in array) {
        HHMomentsModel *model = [HHMomentsModel mj_objectWithKeyValues:dic];
        HHMomentsLayout *layout = [[HHMomentsLayout alloc] initWithMoment:model];
        [self.dataArray addObject:layout];
    }
    
    NSLog(@"come here %@",self.dataArray);
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
