//
//  YVParseOperation.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <INSOperationsKit/INSOperationsKit.h>

@class YVNewsModel;

/// Operation for parsing rss feed into array of YVNewsModel objects
@interface YVParseOperation : INSOperation

@property (copy, nonatomic) NSString *urlType;

@property (copy, nonatomic) NSArray *loadedRSS;

@property (copy, nonatomic) NSArray <YVNewsModel *> *parsedData;

@end
