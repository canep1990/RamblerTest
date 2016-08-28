//
//  YVSortResultsOperationTests.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "Constants.h"
#import "YVSortResultsOperation.h"
#import "YVNewsModel.h"

@interface YVSortResultsOperationTests : XCTestCase
@property (strong, nonatomic) YVSortResultsOperation *operation;
@end

@implementation YVSortResultsOperationTests

- (void)setUp
{
    [super setUp];
    YVNewsModel *newsModel1 = [YVNewsModel new];
    newsModel1.publicationDate = [NSDate date];
    YVNewsModel *newsModel2 = [YVNewsModel new];
    newsModel2.publicationDate = [NSDate date];
    YVNewsModel *newsModel3 = [YVNewsModel new];
    newsModel3.publicationDate = [NSDate date];
    YVNewsModel *newsModel4 = [YVNewsModel new];
    newsModel4.publicationDate = [NSDate date];
    NSArray *lentaResults = @[newsModel1, newsModel2];
    NSArray *gazetaResults = @[newsModel3, newsModel4];
    self.operation = [[YVSortResultsOperation alloc] initWithLentaResults:lentaResults gazetaModels:gazetaResults];
}

- (void)tearDown
{
    self.operation = nil;
    [super tearDown];
}

- (void)testSortOperationSortsGood
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"OperationCompletesSuccessfully"];
    [self.operation ins_addCompletionBlockInMainQueue:^(__kindof NSOperation * _Nonnull operation) {
        [expectation fulfill];
    }];
    [self.operation execute];
    [self waitForExpectationsWithTimeout:YVBackgroundTestExpectationTimeout handler:^(NSError * _Nullable error)
     {
         XCTAssertNotNil(self.operation.sortedObjects);
         NSDate *date1 = self.operation.sortedObjects.firstObject.publicationDate;
         NSDate *date2 = self.operation.sortedObjects.lastObject.publicationDate;
         XCTAssert([date1 timeIntervalSinceDate:date2] > 0, @"Objects must be sorted!");
         XCTAssertTrue(self.operation.finished);
     }];
}

@end
