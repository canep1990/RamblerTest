//
//  YVDisplayLongNewsViewController.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVDisplayLongNewsViewController.h"
#import <UIActivityIndicator-for-SDWebImage/UIImageView+UIActivityIndicatorForSDWebImage.h>

@interface YVDisplayLongNewsViewController ()
@property (strong, nonatomic) IBOutlet UITextView *longTextView;
@property (strong, nonatomic) IBOutlet UILabel *titleDisplayLabel;
@property (strong, nonatomic) IBOutlet UIImageView *previewImageView;
@end

@implementation YVDisplayLongNewsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.presenter.view = self;
    [self.presenter viewDidLoad];
}

#pragma mark - YVDisplayLongNewsViewInput

- (void)configureViewWithNewsModel:(YVNewsModel *)newsModel
{
    self.title = newsModel.sourceString;
    self.longTextView.text = newsModel.fullDescription;
    self.titleDisplayLabel.text = newsModel.title;
    [self.previewImageView setImageWithURL:[NSURL URLWithString:newsModel.imageURLString] completed:nil usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

@end
