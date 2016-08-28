//
//  YVDisplayLongNewsRouterInput.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVDisplayLongNewsPresenterInput.h"

@protocol YVDisplayLongNewsRouterInput <NSObject>

@property (strong, nonatomic) id <YVDisplayLongNewsPresenterInput> presenter;

- (void)presentArticleDetailsInterfaceFromViewController:(UIViewController *)controller;

@end
