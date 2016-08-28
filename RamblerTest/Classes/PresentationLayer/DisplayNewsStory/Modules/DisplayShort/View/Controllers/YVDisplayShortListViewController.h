//
//  YVDisplayShortListViewController.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVDisplayShortListTableCell.h"
#import "YVDisplayShortListAdapter.h"
#import "YVDisplayShortListViewOutput.h"

@interface YVDisplayShortListViewController : UIViewController <YVDisplayShortListViewInput>

@property (strong, nonatomic) IBOutlet UITableView *shortListTableView;
@property (strong, nonatomic) IBOutlet YVDisplayShortListAdapter *shortListAdapter;

@property (strong, nonatomic) id <YVDisplayShortListViewOutput> presenter;

@end
