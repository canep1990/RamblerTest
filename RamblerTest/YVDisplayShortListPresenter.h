//
//  YVDisplayShortListPresenter.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YVDisplayShortListViewOutput.h"
#import "YVDisplayShortListViewInput.h"
#import "YVDisplayShortListInteractorInput.h"
#import "YVDisplayShortListRouter.h"

@interface YVDisplayShortListPresenter : NSObject <YVDisplayShortListViewOutput>

@property (strong, nonatomic) id <YVDisplayShortListInteractorInput> interactor;

@property (strong, nonatomic) id <YVDisplayShortListRouterInput> router;

@end
