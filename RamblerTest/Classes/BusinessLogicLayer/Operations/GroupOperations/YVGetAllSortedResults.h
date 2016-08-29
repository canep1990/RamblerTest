//
//  YVGetAllSortedResults.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <INSOperationsKit/INSOperationsKit.h>
#import "YVNewsModel.h"

/// Group operation for loading results & sorting them
@interface YVGetAllSortedResults : INSGroupOperation

@property (copy, nonatomic) NSArray <YVNewsModel *> *sortedModels;

@end
