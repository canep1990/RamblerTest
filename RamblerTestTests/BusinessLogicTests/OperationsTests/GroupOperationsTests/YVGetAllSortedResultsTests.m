//
//  YVGetAllSortedResultsTests.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "Constants.h"
#import "YVGetAllSortedResults.h"

@interface YVGetAllSortedResultsTests : XCTestCase
@property (strong, nonatomic) YVGetAllSortedResults *operation;
@end

@implementation YVGetAllSortedResultsTests

- (void)setUp
{
    [super setUp];
    self.operation = [YVGetAllSortedResults new];
}

- (void)tearDown {
    
    [super tearDown];
}

- (void)testAllSortedResultsDownloaded
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"OperationCompletesSuccessfully"];
    [self.operation ins_addCompletionBlockInMainQueue:^(__kindof NSOperation * _Nonnull operation) {
        [expectation fulfill];
    }];
    [self.operation execute];
    [self waitForExpectationsWithTimeout:YVBackgroundTestExpectationTimeout handler:^(NSError * _Nullable error)
     {
         XCTAssertNotNil(self.operation.sortedModels);
         NSDate *date1 = self.operation.sortedModels.firstObject.publicationDate;
         NSDate *date2 = self.operation.sortedModels.lastObject.publicationDate;
         XCTAssert([date1 timeIntervalSinceDate:date2] > 0, @"Objects must be sorted!");
         XCTAssertTrue(self.operation.finished);
     }];
}

@end
