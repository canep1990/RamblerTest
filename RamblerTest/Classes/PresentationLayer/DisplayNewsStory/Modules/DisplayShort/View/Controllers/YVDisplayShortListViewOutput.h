//
//  YVDisplayShortListViewOutput.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YVDisplayShortListViewInput.h"
#import "YVDisplayShortListInteractorInput.h"
#import "YVNewsModel.h"

@protocol YVDisplayShortListViewOutput <NSObject>

@property (weak, nonatomic) id <YVDisplayShortListViewInput> view;

- (void)loadModels;

- (void)didSelectNewsModel:(YVNewsModel *)newsModel;

@end
