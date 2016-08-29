//
//  YVLoadNewsService.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YVNewsModel;

typedef void(^YVLoadNewsServiceCompletion)(NSArray <YVNewsModel *> * _Nullable models, NSError * _Nullable error);

/// Service for loading news data
@protocol YVLoadNewsService <NSObject>

- (void)loadNewsWithCompletion:(_Nullable YVLoadNewsServiceCompletion)completion;

@end
