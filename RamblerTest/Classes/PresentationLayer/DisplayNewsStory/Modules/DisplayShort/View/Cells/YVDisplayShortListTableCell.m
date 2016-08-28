//
//  YVDisplayShortListTableCell.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVDisplayShortListTableCell.h"
#import <UIActivityIndicator-for-SDWebImage/UIImageView+UIActivityIndicatorForSDWebImage.h>

@interface YVDisplayShortListTableCell()

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *sourceLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *previewImageView;

@end

@implementation YVDisplayShortListTableCell

- (void)awakeFromNib
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)configureCellWithNewsModel:(YVNewsModel *)model
{
    self.titleLabel.text = model.title;
    self.sourceLabel.text = model.sourceString;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MM yyyy  HH:mm:ss"];
    self.dateLabel.text = [formatter stringFromDate:model.publicationDate];
    [self.previewImageView setImageWithURL:[NSURL URLWithString:model.imageURLString] completed:nil usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    if (highlighted)
    {
        [self highlightRow];
    }
    else
    {
        [self unhighlightRow:YES];
    }
}

- (void)highlightRow
{
    self.backgroundColor = [UIColor lightGrayColor];
}

- (void)unhighlightRow:(BOOL)animated
{
    if (animated)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = [UIColor whiteColor];
        }];
    }
    else
    {
        self.backgroundColor = [UIColor whiteColor];
    }
}

@end
