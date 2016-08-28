//
//  YVConstants.h
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSString *const YVLentaURLString;
FOUNDATION_EXTERN NSString *const YVGazetaURLString;

FOUNDATION_EXTERN NSString *const YVGazetaType;
FOUNDATION_EXTERN NSString *const YVLentaType;

FOUNDATION_EXTERN NSString * const YVErrorDomain;

typedef NS_ENUM(NSInteger, ErrorCode) {
    ErrorParseOperationFailed = 100
};
