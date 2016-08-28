//
//  YVDisplayShortListTableCell.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVNewsModel.h"

static NSString * const YVDisplayShortListTableCellReuseIdentifier = @"YVDisplayShortListTableCellReuseIdentifier";

@interface YVDisplayShortListTableCell : UITableViewCell

- (void)configureCellWithNewsModel:(YVNewsModel *)model;

@end
