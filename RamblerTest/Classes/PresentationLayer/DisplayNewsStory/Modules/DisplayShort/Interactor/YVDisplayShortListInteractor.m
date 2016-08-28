//
//  YVDisplayShortListInteractor.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVDisplayShortListInteractor.h"
#import "YVLoadNewsServiceImplementation.h"

@interface YVDisplayShortListInteractor ()
@end

@implementation YVDisplayShortListInteractor

- (instancetype)init
{
    if (self = [super init])
    {
        self.loadNewsService = [YVLoadNewsServiceImplementation new];
    }
    return self;
}

- (void)getFilteredNewsWithCompletion:(YVLoadNewsServiceCompletion)completion
{
    [self.loadNewsService loadNewsWithCompletion:completion];
}

@end
