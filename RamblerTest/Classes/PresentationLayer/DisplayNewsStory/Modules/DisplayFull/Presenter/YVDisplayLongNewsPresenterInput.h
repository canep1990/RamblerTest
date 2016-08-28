//
//  YVDisplayLongNewsPresenterInput.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YVNewsModel;

@protocol YVDisplayLongNewsPresenterInput <NSObject>

@property (strong, nonatomic) YVNewsModel *newsModel;

@end
