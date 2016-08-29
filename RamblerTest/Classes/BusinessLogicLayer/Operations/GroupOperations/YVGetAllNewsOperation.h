//
//  YVGetAllNewsOperation.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <INSOperationsKit/INSOperationsKit.h>

@class YVNewsModel;

/// Group operation for loading all types of news
@interface YVGetAllNewsOperation : INSGroupOperation
@property (copy, nonatomic) NSArray <YVNewsModel *> *lentaModels;
@property (copy, nonatomic) NSArray <YVNewsModel *> *gazetaModels;
@end
