//
//  YVParseOperation.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVParseOperation.h"
#import "YVNewsModel.h"

@implementation YVParseOperation

- (void)execute
{
    if (self.loadedRSS)
    {
        NSMutableArray <YVNewsModel *> *array = [NSMutableArray new];
        for (NSDictionary *dict in self.loadedRSS)
        {
            YVNewsModel *model = [EKMapper objectFromExternalRepresentation:dict withMapping:[YVNewsModel objectMapping]];
            model.sourceString = self.urlType;
            [array addObject:model];
        }
        self.parsedData = array;
        [self finish];
    }
    else
    {
        [self finishWithError:[NSError errorWithDomain:YVErrorDomain code:ErrorParseOperationFailed userInfo:@{ NSLocalizedDescriptionKey : NSLocalizedString(@"Failed to parse news data", nil) }]];
    }
}

@end
