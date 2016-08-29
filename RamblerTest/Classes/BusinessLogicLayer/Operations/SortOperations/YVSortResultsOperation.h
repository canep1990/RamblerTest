//
//  YVSortResultsOperation.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <INSOperationsKit/INSOperationsKit.h>
#import "YVGetAllNewsOperation.h"

/// Operation for sorting arrays
@interface YVSortResultsOperation : INSOperation

@property (copy, nonatomic) NSArray <YVNewsModel *> *sortedObjects;

- (instancetype)initWithLentaResults:(NSArray <YVNewsModel *> *)lentaModels gazetaModels:(NSArray <YVNewsModel *> *)gazetaModels;

@end
