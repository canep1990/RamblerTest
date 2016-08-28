//
//  YVDisplayLongNewsRouter.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVDisplayLongNewsRouter.h"
#import "YVDisplayLongNewsViewController.h"
#import "YVDisplayLongNewsPresenter.h"

@implementation YVDisplayLongNewsRouter
@synthesize presenter = _presenter;

- (instancetype)init
{
    if (self = [super init])
    {
        self.presenter = [YVDisplayLongNewsPresenter new];
    }
    return self;
}

- (void)presentArticleDetailsInterfaceFromViewController:(UIViewController *)controller
{
    YVDisplayLongNewsViewController *longNewsViewController = [self longNewsControllerFromStoryboard];
    longNewsViewController.presenter = (id <YVDisplayLongNewsViewOutput>)self.presenter;
    [controller.navigationController pushViewController:longNewsViewController animated:YES];
}

#pragma mark - private methods

- (YVDisplayLongNewsViewController *)longNewsControllerFromStoryboard
{
    UIStoryboard *storyboard = [self moduleStoryboard];
    YVDisplayLongNewsViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([YVDisplayLongNewsViewController class])];
    return viewController;
}

- (UIStoryboard *)moduleStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"DisplayNews" bundle:[NSBundle mainBundle]];
    return storyboard;
}

@end
