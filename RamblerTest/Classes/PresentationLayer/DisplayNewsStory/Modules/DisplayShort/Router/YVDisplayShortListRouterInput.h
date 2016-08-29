//
//  YVDisplayShortListRouterInput.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YVNewsModel;

/// Router for handling transition between modules
@protocol YVDisplayShortListRouterInput <NSObject>

@property (weak, nonatomic) UIViewController *viewController;

- (void)presentLongNewsModuleForSelectedNews:(YVNewsModel *)selectedModel;

@end

