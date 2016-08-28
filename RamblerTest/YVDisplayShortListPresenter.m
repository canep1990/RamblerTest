//
//  YVDisplayShortListPresenter.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVDisplayShortListPresenter.h"
#import "YVDisplayShortListInteractor.h"

@implementation YVDisplayShortListPresenter
@synthesize view = _view;
@synthesize interactor = _interactor;

- (instancetype)init
{
    if (self = [super init])
    {
        self.interactor = [YVDisplayShortListInteractor new];
        self.router = [YVDisplayShortListRouter new];
    }
    return self;
}

#pragma mark - YVDisplayShortListViewOutput

- (void)loadModels
{
    [self.view showLoadingIndicator];
    __weak typeof(self) weakSelf = self;
    [self.interactor getFilteredNewsWithCompletion:^(NSArray<YVNewsModel *> * _Nullable models, NSError * _Nullable error)
    {
        [weakSelf.view updateViewWithModels:models error:error];
    }];
}

- (void)didSelectNewsModel:(YVNewsModel *)newsModel
{
    self.router.viewController = (UIViewController *)self.view;
    [self.router presentLongNewsModuleForSelectedNews:newsModel];
}

@end
