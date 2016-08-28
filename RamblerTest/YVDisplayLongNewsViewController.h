//
//  YVDisplayLongNewsViewController.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVNewsModel.h"
#import "YVDisplayLongNewsViewInput.h"
#import "YVDisplayLongNewsViewOutput.h"

@interface YVDisplayLongNewsViewController : UIViewController <YVDisplayLongNewsViewInput>

@property (weak, nonatomic) id <YVDisplayLongNewsViewOutput> presenter;

@end
