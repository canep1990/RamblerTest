//
//  YVLoadNewsServiceImplementation.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVLoadNewsServiceImplementation.h"
#import "YVGetAllSortedResults.h"

@implementation YVLoadNewsServiceImplementation

- (void)loadNewsWithCompletion:(YVLoadNewsServiceCompletion)completion
{
    YVGetAllSortedResults *allOperation = [[YVGetAllSortedResults alloc] init];
    [allOperation ins_addCompletionBlockInMainQueue:^(__kindof NSOperation * _Nonnull operation) {
        YVGetAllSortedResults *op = (YVGetAllSortedResults *)operation;
        if (completion)
        {
            completion(op.sortedModels, op.internalErrors.firstObject);
        }
    }];
    [[INSOperationQueue globalQueue] addOperation:allOperation];
}

@end
