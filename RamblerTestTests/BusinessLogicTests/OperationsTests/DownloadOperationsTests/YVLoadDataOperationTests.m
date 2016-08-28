//
//  YVLoadDataOperationTests.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "YVLoadDataOperation.h"
#import "Constants.h"

@interface YVLoadDataOperationTests : XCTestCase

@property (strong, nonatomic) YVLoadDataOperation *operation;

@end

@implementation YVLoadDataOperationTests

- (void)setUp
{
    [super setUp];
    self.operation = [[YVLoadDataOperation alloc] initWithURLType:OCMClassMock([NSString class])];
}

- (void)tearDown
{
    self.operation = nil;
    [super tearDown];
}

- (void)testOperationCompletesSuccessfully
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"OperationCompletesSuccessfully"];
    [self.operation ins_addCompletionBlockInMainQueue:^(__kindof NSOperation * _Nonnull operation) {
        [expectation fulfill];
    }];
    [self.operation execute];
    [self waitForExpectationsWithTimeout:YVBackgroundTestExpectationTimeout handler:^(NSError * _Nullable error)
    {
        XCTAssertNotNil(self.operation.loadedRSS);
        XCTAssertTrue(self.operation.finished);
    }];
}

@end
