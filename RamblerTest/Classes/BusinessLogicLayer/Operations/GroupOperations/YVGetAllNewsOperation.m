//
//  YVGetAllNewsOperation.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVGetAllNewsOperation.h"
#import "YVNewsModel.h"
#import "YVGetNewsOperation.h"
#import "YVConstants.h"

@implementation YVGetAllNewsOperation

- (instancetype)init
{
    self = [super initWithOperations:@[]];
    if (self)
    {
        YVGetNewsOperation *lentaNews = [[YVGetNewsOperation alloc] initWithURLType:YVLentaType];
        YVGetNewsOperation *gazetaNews = [[YVGetNewsOperation alloc] initWithURLType:YVGazetaType];
        __weak typeof(self) weakSelf = self;
        __weak typeof(gazetaNews) weakGazetaOperation = gazetaNews;
        __weak typeof(lentaNews) weakLentaOperation = lentaNews;
        [lentaNews ins_addCompletionBlock:^(__kindof NSOperation * _Nonnull operation) {
            weakSelf.lentaModels = weakLentaOperation.loadedModels;
        }];
        [gazetaNews ins_addCompletionBlock:^(__kindof NSOperation * _Nonnull operation) {
            weakSelf.gazetaModels = weakGazetaOperation.loadedModels;
        }];
        [self addOperation:lentaNews];
        [self addOperation:gazetaNews];
    }
    return self;
}

@end
