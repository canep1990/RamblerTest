//
//  YVGetAllNewsOperation.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <INSOperationsKit/INSOperationsKit.h>

@class YVNewsModel;

/// Group operation for loading any type of news & parsing all the data
@interface YVGetNewsOperation : INSGroupOperation
- (instancetype)initWithURLType:(NSString *)urlType;
@property (copy, nonatomic) NSArray <YVNewsModel *> *loadedModels;
@end
