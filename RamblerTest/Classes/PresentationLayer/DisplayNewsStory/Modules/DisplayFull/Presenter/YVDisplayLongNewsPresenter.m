//
//  YVDisplayLongNewsPresenter.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVDisplayLongNewsPresenter.h"
#import "YVNewsModel.h"

@implementation YVDisplayLongNewsPresenter
@synthesize newsModel = _newsModel, view = _view;

- (void)viewDidLoad
{
    [self.view configureViewWithNewsModel:self.newsModel];
}

@end
