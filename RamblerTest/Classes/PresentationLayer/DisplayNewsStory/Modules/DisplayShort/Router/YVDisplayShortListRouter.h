//
//  YVDisplayShortListRouter.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YVDisplayShortListRouterInput.h"
#import "YVDisplayLongNewsRouterInput.h"
#import "YVDisplayLongNewsRouter.h"

/// Basic implementation of YVDisplayShortListRouterInput
@interface YVDisplayShortListRouter : NSObject <YVDisplayShortListRouterInput>

@property (strong, nonatomic) id <YVDisplayLongNewsRouterInput> detailsRouter;

@end
