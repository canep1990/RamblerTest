//
//  YVLoadDataOperation.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <INSOperationsKit/INSOperationsKit.h>
#import "YVConstants.h"

/// Operation for loading rss feed
@interface YVLoadDataOperation : INSOperation

- (instancetype)initWithURLType:(NSString *)urlType;

@property (copy, nonatomic) NSArray *loadedRSS;

@end
