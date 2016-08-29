//
//  YVDisplayShortListInteractor.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YVDisplayShortListInteractorInput.h"
#import "YVLoadNewsService.h"

/// Implementation of YVDisplayShortListInteractorInput
@interface YVDisplayShortListInteractor : NSObject <YVDisplayShortListInteractorInput>

@property (strong, nonatomic) id <YVLoadNewsService> loadNewsService;

@end
