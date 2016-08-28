//
//  YVDisplayShortListInteractorTests.m
//  RamblerTest
//
//  Created by Юрий Воскресенский on 28.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Constants.h"
#import "YVDisplayShortListInteractor.h"

@interface YVDisplayShortListInteractorTests : XCTestCase
@property (strong, nonatomic) id <YVDisplayShortListInteractorInput> interactor;
@end

@implementation YVDisplayShortListInteractorTests

- (void)setUp
{
    [super setUp];
    self.interactor = [YVDisplayShortListInteractor new];
}

- (void)tearDown
{
    self.interactor = nil;
    [super tearDown];
}

- (void)testInteractorLoadsData
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Interactor loads data"];
    [self.interactor getFilteredNewsWithCompletion:^(NSArray<YVNewsModel *> * _Nullable models, NSError * _Nullable error) {
        XCTAssertTrue(models != nil || error != nil);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:YVBackgroundTestExpectationTimeout handler:nil];
}

@end
