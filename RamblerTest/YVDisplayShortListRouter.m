//
//  YVDisplayShortListRouter.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVDisplayShortListRouter.h"
#import "YVNewsModel.h"
#import "YVDisplayLongNewsViewController.h"

@implementation YVDisplayShortListRouter
@synthesize viewController = _viewController;

- (instancetype)init
{
    if (self = [super init])
    {
        self.detailsRouter = [YVDisplayLongNewsRouter new];
    }
    return self;
}

- (void)presentLongNewsModuleForSelectedNews:(YVNewsModel *)selectedModel
{
    self.detailsRouter.presenter.newsModel = selectedModel;
    [self.detailsRouter presentArticleDetailsInterfaceFromViewController:self.viewController];
}

@end
