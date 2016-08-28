//
//  YVLoadDataOperation.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVLoadDataOperation.h"
#import "YVFixedURLSessionManager.h"
#import <AFNetworking/AFNetworking.h>
#import "YVURLSessionOperation.h"
#import "XMLDictionary.h"
#import "YVConstants.h"

@interface YVLoadDataOperation()
@property (strong, nonatomic) YVURLSessionOperation *sessionOperation;
@property (copy, nonatomic) NSString *urlType;
@end

@implementation YVLoadDataOperation

- (instancetype)initWithURLType:(NSString *)urlType
{
    if (self = [super init])
    {
        NSString *urlString;
        if ([urlType isEqualToString:YVLentaType])
        {
            urlString = YVLentaURLString;
        }
        else
        {
            urlString = YVGazetaURLString;
        }
        YVFixedURLSessionManager *httpManager = [YVFixedURLSessionManager manager];
        httpManager.responseSerializer = [[AFXMLParserResponseSerializer alloc] init];
        httpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/xml", @"text/xml",@"application/rss+xml", @"application/atom+xml", nil];
        NSURLSessionDataTask *dataTask = [httpManager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject)
        {
            NSDictionary *resp = [[XMLDictionaryParser sharedInstance] dictionaryWithParser:responseObject];
            NSDictionary *dict = resp[@"channel"];
            NSArray *loadedArray = dict[@"item"];
            self.loadedRSS = loadedArray;
            [self finish];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
            [self finishWithError:error];
        }];
        self.sessionOperation = [YVURLSessionOperation operationWithTask:dataTask];
    }
    return self;
}

- (void)execute
{
    [self.sessionOperation execute];
}

@end
 