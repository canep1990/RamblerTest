//
//  YVNewsModel.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVNewsModel.h"

@implementation YVNewsModel

+ (EKObjectMapping *)objectMapping
{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping * _Nonnull mapping)
    {
        [mapping mapKeyPath:@"title" toProperty:@"title"];
        [mapping mapKeyPath:@"author" toProperty:@"title"];
        [mapping mapKeyPath:@"description" toProperty:@"fullDescription"];
        [mapping mapKeyPath:@"enclosure._url" toProperty:@"imageURLString"];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        dateFormatter.dateFormat = EKRFC_822DatetimeFormat;
        [mapping mapKeyPath:@"pubDate" toProperty:@"publicationDate" withDateFormatter:dateFormatter];
    }];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"title: %@ author: %@ publicationDate: %@ imageURLString: %@", self.title, self.author, self.publicationDate, self.imageURLString];
}

@end
