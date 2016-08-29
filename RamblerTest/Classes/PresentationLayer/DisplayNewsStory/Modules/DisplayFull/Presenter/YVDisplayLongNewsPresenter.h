//
//  YVDisplayLongNewsPresenter.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVDisplayLongNewsPresenterInput.h"
#import "YVDisplayLongNewsViewOutput.h"
#import "YVDisplayLongNewsViewInput.h"

/// Implementation of full news presenter
@interface YVDisplayLongNewsPresenter : NSObject <YVDisplayLongNewsPresenterInput, YVDisplayLongNewsViewOutput>

@end
