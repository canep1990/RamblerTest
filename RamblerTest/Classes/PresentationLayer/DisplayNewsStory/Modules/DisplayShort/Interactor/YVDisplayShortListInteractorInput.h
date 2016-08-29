//
//  YVDisplayShortListInteractorInput.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YVLoadNewsService.h"

/// Interactor for getting news
@protocol YVDisplayShortListInteractorInput <NSObject>

- (void)getFilteredNewsWithCompletion:(YVLoadNewsServiceCompletion)completion;

@end