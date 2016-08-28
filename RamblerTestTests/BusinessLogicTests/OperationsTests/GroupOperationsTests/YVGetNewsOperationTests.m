//
//  YVGetNewsOperationTests.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "Constants.h"
#import "YVGetNewsOperation.h"

@interface YVGetNewsOperationTests : XCTestCase
@property (strong, nonatomic) YVGetNewsOperation *operation;
@end

@implementation YVGetNewsOperationTests

- (void)setUp
{
    [super setUp];
    self.operation = [[YVGetNewsOperation alloc] initWithURLType:OCMClassMock([NSString class])];
}

- (void)tearDown
{
    self.operation = nil;
    [super tearDown];
}

- (void)testGetAllNewsOperation
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"OperationCompletesSuccessfully"];
    [self.operation ins_addCompletionBlockInMainQueue:^(__kindof NSOperation * _Nonnull operation) {
        [expectation fulfill];
    }];
    [self.operation execute];
    [self waitForExpectationsWithTimeout:YVBackgroundTestExpectationTimeout handler:^(NSError * _Nullable error)
    {
         XCTAssertNotNil(self.operation.loadedModels);
         XCTAssertTrue(self.operation.finished);
    }];
}

@end
