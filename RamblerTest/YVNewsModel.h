//
//  YVNewsModel.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EasyMapping/EasyMapping.h>
#import "YVConstants.h"

@interface YVNewsModel : NSObject <EKMappingProtocol>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *author;
@property (copy, nonatomic) NSString *fullDescription;
@property (copy, nonatomic) NSString *imageURLString;
@property (strong, nonatomic) NSDate *publicationDate;
@property (copy, nonatomic) NSString *sourceString;

@end
