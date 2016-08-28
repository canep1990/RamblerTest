//
//  YVDisplayShortListViewInput.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YVNewsModel.h"

@protocol YVDisplayShortListViewInput <NSObject>

- (void)updateViewWithModels:(NSArray <YVNewsModel *> *)models error:(NSError *)error;

- (void)showLoadingIndicator;

@end
