//
//  YVGetAllSortedResults.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVGetAllSortedResults.h"
#import "YVGetAllNewsOperation.h"
#import "YVSortResultsOperation.h"

@implementation YVGetAllSortedResults

- (instancetype)init
{
    if (self = [super initWithOperations:@[]])
    {
        YVGetAllNewsOperation *getAllNews = [[YVGetAllNewsOperation alloc] init];
        [self addOperation:getAllNews];
    }
    return self;
}

- (void)operationDidFinish:(NSOperation *)operation withErrors:(NSArray<NSError *> *)errors
{
    if (errors.count == 0)
    {
        if ([operation isKindOfClass:[YVGetAllNewsOperation class]])
        {
            YVGetAllNewsOperation *getAllNews = (YVGetAllNewsOperation *)operation;
            YVSortResultsOperation *sortOperation = [[YVSortResultsOperation alloc] initWithLentaResults:getAllNews.lentaModels gazetaModels:getAllNews.gazetaModels];
            [self addOperation:sortOperation];
        }
        if ([operation isKindOfClass:[YVSortResultsOperation class]])
        {
            YVSortResultsOperation *sortOperation = (YVSortResultsOperation *)operation;
            self.sortedModels = sortOperation.sortedObjects;
        }
    }
}

@end
