//
//  YVParseOperationTests.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "YVParseOperation.h"
#import "Constants.h"

@interface YVParseOperationTests : XCTestCase
@property (strong, nonatomic) YVParseOperation *operation;
@end

@implementation YVParseOperationTests

- (void)setUp {
    [super setUp];
    self.operation = [YVParseOperation new];
    self.operation.urlType = OCMClassMock([NSString class]);
    NSDictionary *dict = @{ @"title" : @"ttt" };
    NSArray *loadedRSS = [NSArray arrayWithObject:dict];
    self.operation.loadedRSS = loadedRSS;
}

- (void)tearDown {
    self.operation = nil;
    [super tearDown];
}

- (void)testRunOperationProcessing
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"OperationCompletesSuccessfully"];
    [self.operation ins_addCompletionBlockInMainQueue:^(__kindof NSOperation * _Nonnull operation) {
        [expectation fulfill];
    }];
    [self.operation execute];
    [self waitForExpectationsWithTimeout:YVBackgroundTestExpectationTimeout handler:^(NSError * _Nullable error)
    {
         XCTAssertNotNil(self.operation.parsedData);
         XCTAssertTrue(self.operation.finished);
    }];
}

@end
