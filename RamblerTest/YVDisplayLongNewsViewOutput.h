//
//  YVDisplayLongNewsViewOutput.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVDisplayLongNewsViewInput.h"

@protocol YVDisplayLongNewsViewOutput <NSObject>

@property (weak, nonatomic) id <YVDisplayLongNewsViewInput> view;

- (void)viewDidLoad;

@end
