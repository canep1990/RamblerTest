//
//  YVDisplayShortList.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVDisplayShortListTableCell.h"
#import "YVNewsModel.h"

@class YVDisplayShortListAdapter;

@protocol YVDisplayShortListAdapterDelegate <NSObject>

- (void)displayShortListAdapter:(YVDisplayShortListAdapter *)adapter didSelectModel:(YVNewsModel *)newsModel;

@end

@interface YVDisplayShortListAdapter : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) id <YVDisplayShortListAdapterDelegate> delegate;

@property (copy, nonatomic) NSArray <YVNewsModel *> *modelsArray;

@end
