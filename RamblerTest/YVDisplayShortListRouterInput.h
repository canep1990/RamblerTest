//
//  YVDisplayShortListRouterInput.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YVNewsModel;

@protocol YVDisplayShortListRouterInput <NSObject>

@property (weak, nonatomic) UIViewController *viewController;

- (void)presentLongNewsModuleForSelectedNews:(YVNewsModel *)selectedModel;

@end

