//
//  YVGetAllNewsOperation.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVGetNewsOperation.h"
#import "YVLoadDataOperation.h"
#import "YVParseOperation.h"
#import "YVNewsModel.h"

@interface YVGetNewsOperation()
@property (copy, nonatomic) NSString *urlType;
@end

@implementation YVGetNewsOperation

- (instancetype)initWithURLType:(NSString *)urlType
{
    self = [super initWithOperations:@[]];
    if (self)
    {
        YVLoadDataOperation *downloadOperation = [[YVLoadDataOperation alloc] initWithURLType:urlType];
        YVParseOperation *parseOperation = [YVParseOperation new];
        self.urlType = urlType;
        parseOperation.urlType = urlType;
        [parseOperation addDependency:downloadOperation];
        __weak typeof(downloadOperation) weakLoadOperation = downloadOperation;
        __weak typeof(parseOperation) weakParseOperation = parseOperation;
        [downloadOperation ins_addCompletionBlock:^(__kindof NSOperation * _Nonnull operation)
        {
            weakParseOperation.loadedRSS = weakLoadOperation.loadedRSS;
        }];
        [self addOperation:downloadOperation];
        [self addOperation:parseOperation];
    }
    return self;
}

- (void)operationDidFinish:(NSOperation *)operation withErrors:(NSArray<NSError *> *)errors
{
    if (errors.count == 0)
    {
        if ([operation isKindOfClass:[YVParseOperation class]])
        {
            YVParseOperation *pO = (YVParseOperation *)operation;
            self.loadedModels = pO.parsedData;
        }
    }
}

@end
