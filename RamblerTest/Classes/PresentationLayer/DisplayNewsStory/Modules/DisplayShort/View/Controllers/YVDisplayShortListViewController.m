//
//  YVDisplayShortListViewController.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVDisplayShortListViewController.h"
#import "YVDisplayShortListPresenter.h"
#import <MBProgressHUD/MBProgressHUD.h>

static CGFloat const kStandardCellHeight = 70;

@interface YVDisplayShortListViewController () <YVDisplayShortListAdapterDelegate>

@end

@implementation YVDisplayShortListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"News", nil);
    [self.shortListTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YVDisplayShortListTableCell class]) bundle:nil] forCellReuseIdentifier:YVDisplayShortListTableCellReuseIdentifier];
    self.shortListAdapter.delegate = self;
    self.shortListTableView.rowHeight = kStandardCellHeight;
    self.presenter = [YVDisplayShortListPresenter new];
    self.presenter.view = self;
    [self.presenter loadModels];
}

#pragma mark - IBAction

- (IBAction)update:(id)sender
{
    if (![self hasProgressHUD])
    {
        [self.presenter loadModels];
    }
}

#pragma mark - YVDisplayShortListAdapterDelegate

- (void)displayShortListAdapter:(YVDisplayShortListAdapter *)adapter didSelectModel:(YVNewsModel *)newsModel
{
    [self.presenter didSelectNewsModel:newsModel];
}

#pragma mark - YVDisplayShortListViewInput

- (void)updateViewWithModels:(NSArray<YVNewsModel *> *)models error:(NSError *)error
{
    [self removeProgressHUD];
    if (error)
    {
        [self displayError:error];
    }
    else
    {
        self.shortListAdapter.modelsArray = models;
        [self.shortListTableView reloadData];
    }
}

- (void)showLoadingIndicator
{
    [self addProgressHUD];
}

#pragma mark - Private

- (void)addProgressHUD
{
    MBProgressHUD *progressHUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:progressHUD];
    [progressHUD showAnimated:YES];
}

- (void)removeProgressHUD
{
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[MBProgressHUD class]])
        {
            MBProgressHUD *progressHUD = (MBProgressHUD *)view;
            [progressHUD hideAnimated:YES];
            [progressHUD removeFromSuperview];
        }
    }
}

- (BOOL)hasProgressHUD
{
    BOOL hasProgressHUD = NO;
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[MBProgressHUD class]])
        {
            hasProgressHUD = YES;
            break;
        }
    }
    return hasProgressHUD;
}

- (void)displayError:(NSError *)error
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:error.localizedDescription message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
