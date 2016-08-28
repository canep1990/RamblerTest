//
//  YVLoadNewsServiceTests.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "Constants.h"
#import "YVLoadNewsService.h"
#import "YVLoadNewsServiceImplementation.h"
#import "YVNewsModel.h"

@interface YVLoadNewsServiceTests : XCTestCase
@property (strong, nonatomic) id <YVLoadNewsService> service;
@end

@implementation YVLoadNewsServiceTests

- (void)setUp
{
    [super setUp];
    self.service = [YVLoadNewsServiceImplementation new];
}

- (void)tearDown
{
    self.service = nil;
    [super tearDown];
}

- (void)testServiceExecutesProperly
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Service should "];
    [self.service loadNewsWithCompletion:^(NSArray<YVNewsModel *> * _Nullable models, NSError * _Nullable error) {
        XCTAssertTrue(models != nil || error != nil);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:YVBackgroundTestExpectationTimeout handler:nil];
}

@end
