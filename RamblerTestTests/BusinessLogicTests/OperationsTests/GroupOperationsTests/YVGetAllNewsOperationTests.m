//
//  YVGetAllNewsOperationTests.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "Constants.h"
#import "YVGetAllNewsOperation.h"

@interface YVGetAllNewsOperationTests : XCTestCase
@property (strong, nonatomic) YVGetAllNewsOperation *operation;
@end

@implementation YVGetAllNewsOperationTests

- (void)setUp
{
    [super setUp];
    self.operation = [YVGetAllNewsOperation new];
}

- (void)tearDown
{
    self.operation = nil;
    [super tearDown];
}

- (void)testAllNewsOperationDownload
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"OperationCompletesSuccessfully"];
    [self.operation ins_addCompletionBlockInMainQueue:^(__kindof NSOperation * _Nonnull operation) {
        [expectation fulfill];
    }];
    [self.operation execute];
    [self waitForExpectationsWithTimeout:YVBackgroundTestExpectationTimeout handler:^(NSError * _Nullable error)
    {
         XCTAssertNotNil(self.operation.lentaModels);
         XCTAssertNotNil(self.operation.gazetaModels);
         XCTAssertTrue(self.operation.finished);
    }];
}

@end
